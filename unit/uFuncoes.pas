unit uFuncoes;

interface

uses
  Vcl.Forms, System.Classes, Vcl.DBCtrls, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.Client, WinInet;

// Declara��o Procedures
procedure pCriarForm(classeForm: TFormClass; frm:TForm);
procedure pDbEditCadastro(frm:TForm; dbedit:TDBEdit);
procedure pBtnCadastros(btnNovo:TButton; btnAlterar:TButton; btnCancelar:TButton; btnSalvar:TButton);
procedure pPesqLocate(cds:TFDQuery; edtPesq:TEdit; campoPesq:string);
procedure pFecharSistema;
procedure pFormataValor(pValor:TEdit);
procedure pExecutaSqlInsertUpDate(pSQL:string);
procedure pFechaCaixa(pNumCaixa:string; pUsuario:Integer);
procedure pBuscaProdutoPorCodigo(pCodigo:string; pEdtCodigo, pEdtDesc, pEdtTm, pEdtFatias, pEdtVl:TEdit);

// Declara��o Function
function fCamposObrigatorios(Dataset: TDataSet): Boolean;
function fNomePizzaria: string;
function fNivelUsuario(pCodigo:Integer):Integer;
function fBuscaSaborPizzaPorCodigo(pCodigo:string):string;
function fBuscaCaixas(pCodigo:string):string;
function fRetornaAutoIncrement(pTabela:string):string;
function fAbreCaixa(pUsuario, pCodCaixa:Integer; pValor:string):Boolean;
function fNomeComputador : string;
function fQtdCaixasAbertos:Integer;
function fSomaValorTotalVenda(pValorUnitario,pValorTotal:Double):Double;
function fVersaoExe: string;
function fConexaoInternet :boolean;
function fRegistroExiste(pTabela, pCampo, pBusca:string):Boolean;

// Variaveis Globais
var
  // Integer
  iGbCodUsuario,
  iGbNumCaixaAberto,
  iGbOrdem : Integer;
  // String
  sGbVersao,
  sGbDtCaixaAberto,
  sGbDescCaixa,
  sGbUsuarioLogado,
  sGbTipoProd,
  sGbConsultaVendasDataInicio,
  sGbConsultaVendasDataFim : string;
  sGbCodEntregador : string = '';
  sGbCxAbertFechado: string = '';
implementation

uses
  Vcl.Dialogs, System.SysUtils, Xml.XMLDoc,
  Xml.XMLIntf, uMensagens, Winapi.Windows, Vcl.Graphics, UdmAuxiliar,
  UdmAuxiliar2, UdmCaixas;

// Implementa��o Procedures

procedure pCriarForm(classeForm: TFormClass; frm:TForm);
begin
  try
    Application.CreateForm(classeForm, frm);
    frm.ShowModal;
  finally
    frm.free;
  end;
end;

procedure pDbEditCadastro(frm:TForm; dbedit:TDBEdit);
var
  i : Integer;
begin
  if not dbedit.CanFocus then
  begin
    for i := 0 to Pred(frm.ComponentCount) do
    begin
      if frm.Components[i] is TDBEdit then
        TDBEdit(frm.Components[i]).Enabled := True;

      if frm.Components[i] is TEdit then
        TEdit(frm.Components[i]).Enabled := False;
    end;
    dbedit.SetFocus;
  end
  else
  begin
    for i := 0 to Pred(frm.ComponentCount) do
    begin
      if frm.Components[i] is TDBEdit then
        TDBEdit(frm.Components[i]).Enabled := False;

      if frm.Components[i] is TEdit then
        TEdit(frm.Components[i]).Enabled := True;
    end;
  end;
end;

procedure pBtnCadastros(btnNovo:TButton; btnAlterar:TButton; btnCancelar:TButton; btnSalvar:TButton);
begin
  if btnNovo.CanFocus then
  begin
    btnNovo.Enabled := False;
    btnAlterar.Enabled := False;
    btnCancelar.Enabled := True;
    btnSalvar.Enabled := True;
  end
  else
  begin
    btnNovo.Enabled := True;
    btnNovo.SetFocus;
    btnAlterar.Enabled := True;
    btnCancelar.Enabled := False;
    btnSalvar.Enabled := False;
  end;

end;

procedure pPesqLocate(cds:TFDQuery; edtPesq:TEdit; campoPesq:string);
begin
  cds.Locate(campoPesq, edtPesq.Text,[loPartialKey, loCaseInsensitive]);
  cds.Filtered := False;
  cds.Filter := 'UPPER(' + campoPesq + ') LIKE' + UpperCase(QuotedStr('%'+ Trim(edtPesq.Text) + '%'));
  cds.Filtered := True;
end;

procedure pFecharSistema;
begin
  if application.MessageBox(msg1, cMsg, Mb_YesNo+MB_iconQuestion)= IdYes then
  begin
    Application.Terminate;
  end
  else
  begin
    Abort
  end;
end;

procedure pFormataValor(pValor:TEdit);
var
s : string;
v : double;
I : integer;
begin
  //1� Passo : se o edit estiver vazio, nada pode ser feito.
  if pValor.Text = EmptyStr then
   pValor.Text := '0,00';

  //2� Passo : obter o texto do edit, SEM a virgula e SEM o ponto decimal:
  s := '';
  for I := 1 to length(pValor.Text) do
    if CharInSet(pValor.Text[I],['0'..'9', #8, #9]) then
      s := s + pValor.Text[I];

  //3� Passo : fazer com que o conte�do do edit apresente 2 casas decimais:
  v := strtofloat(s);
  v := (v /100); // para criar 2 casa decimais

  //4� Passo : Formata o valor de (V) para aceitar valores do tipo 0,10.
  pValor.Text     := FormatFloat('#####0.00',v);
  pValor.SelStart := 0;
end;

procedure pExecutaSqlInsertUpDate(pSQL:string);
begin
  try
    try
      if not Assigned(dmAuxiliar) then
      dmAuxiliar := TdmAuxiliar.Create(Application);

      with dmAuxiliar.fdqAuxiliar do
      begin
        Close;
        SQL.Add(pSQL);
        ExecSQL;
      end;

    except on e : Exception do
      ShowMessage(e.Message);
    end;

  finally
      FreeAndNil(dmAuxiliar);
  end;
end;

procedure pFechaCaixa(pNumCaixa:string; pUsuario:Integer);
var
  sLcSQL,
  sLcDataHora,
  sLcValorFech:string;
begin
  try
    sLcSQL      := EmptyStr;
    sLcDataHora := EmptyStr;

    sLcDataHora := FormatDateTime('yyyy.mm.dd', Now);
    sLcDataHora := sLcDataHora + ' ' + FormatDateTime('hh:mm:ss', Now);
    // Totalizar valor por caixa no fechamento
    try
      try
        if not Assigned(dmAuxiliar2) then
        dmAuxiliar2 := TdmAuxiliar2.Create(Application);

        with dmAuxiliar2.fdqAuxiliar2 do
        begin
          Close;
          SQL.Add('SELECT V.NUMCAIXA, SUM(VFP.VALOR) VL_TOTAL ' +
                  'FROM VENDASFORMAPGTO VFP ' +
                  'INNER JOIN VENDAS V ON V.ID = VFP.NUMVENDA ' +
                  'WHERE V.NUMCAIXA = ' + QuotedStr(pNumCaixa)  +
                  'GROUP BY V.NUMCAIXA');
          Open;

          if not IsEmpty then
          begin
            sLcValorFech := FormatFloat('#####0.00', FieldByName('VL_TOTAL').AsFloat);
            sLcValorFech := StringReplace(sLcValorFech, ',', '.',[rfReplaceAll]);
          end;
        end;

      except on e : Exception do
        ShowMessage(e.Message);
      end;

    finally
        FreeAndNil(dmAuxiliar2);
    end;

    sLcSQL := 'UPDATE MOVCAIXAS '   +
              'SET USUARIO_FECH = ' + QuotedStr(IntToStr(pUsuario)) + ', ' +
              'VALOR_FECH = '       + sLcValorFech + ', ' +
              'DATA_FECH = '        + QuotedStr(sLcDataHora) + ', ' +
              'STATUS = '           + QuotedStr('F') + ' ' +
              'WHERE ID = '         + QuotedStr(pNumCaixa);
    try
      if not Assigned(dmAuxiliar) then
      dmAuxiliar := TdmAuxiliar.Create(Application);

      with dmAuxiliar.fdqAuxiliar do
      begin
        Close;
        SQL.Add(sLcSQL);
        ExecSQL;
      end;

    except on e : Exception do
      ShowMessage(e.Message);
    end;

  finally
      FreeAndNil(dmAuxiliar);
  end;
end;

procedure pBuscaProdutoPorCodigo(pCodigo:string; pEdtCodigo, pEdtDesc, pEdtTm, pEdtFatias, pEdtVl:TEdit);
begin
  try
    if not Assigned(dmAuxiliar) then
      dmAuxiliar := TdmAuxiliar.Create(Application);

    with dmAuxiliar.fdqAuxiliar do
    begin
      Close;
      SQL.Add( ' SELECT * FROM PRODUTOS' +
               ' WHERE CODINTERNO = ' + QuotedStr(Trim(pCodigo)));
      Open;
      if not IsEmpty then
      begin
        pEdtCodigo.Text := FieldByName('CODINTERNO').AsString;
        pEdtDesc.Text   := FieldByName('DESCRICAO').AsString;
        pEdtTm.Text     := FieldByName('CM').AsString;
        pEdtFatias.Text := FieldByName('FATIAS').AsString;
        pEdtVl.Text     := FormatFloat('#####0.00',StrToFloat(FieldByName('VALOR').AsString));
        sGbTipoProd     := FieldByName('TIPO').AsString;
      end
      else
      begin
        if application.MessageBox(Pchar(Format(msg16,[pEdtCodigo.Text])), aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
        begin
          pEdtCodigo.Clear;
          if pEdtCodigo.CanFocus then
            pEdtCodigo.SetFocus;

          Abort;
        end;
      end;
    end;

  finally
      FreeAndNil(dmAuxiliar);
  end;
end;
//=========================================================//
// Implementa��o Fun��es
function fCamposObrigatorios(Dataset: TDataSet): Boolean;
var i: Integer;
begin
  Result := True;
  for i := 0 to Dataset.Fields.Count - 1 do
  begin
    if (Dataset.Fields[i].Required) and ((Dataset.Fields[i].IsNull) or (Trim(Dataset.Fields[i].AsString).IsEmpty)) then
    begin
      if Application.MessageBox(PChar(Dataset.Fields[i].DisplayLabel + ' � obrigat�rio!'), aMsg, MB_OK + MB_ICONERROR) = IDOK then
      Result := False;
      Dataset.Fields[i].FocusControl;
      Break;
    end;
  end;
end;

function fNomePizzaria: string;
begin
  if not Assigned(dmAuxiliar) then
    dmAuxiliar := TdmAuxiliar.Create(Application);
  try
    with dmAuxiliar.fdqAuxiliar do
    begin
      Close;
      SQL.Add('SELECT FANTASIA FROM EMPRESA');
      Open;
      Result := FieldByName('fantasia').AsString;
    end;
  finally
    FreeAndNil(dmAuxiliar);
  end;
end;

function fNivelUsuario(Pcodigo:Integer):Integer;
begin
  if not Assigned(dmAuxiliar) then
    dmAuxiliar := TdmAuxiliar.Create(Application);
  try
    with dmAuxiliar.fdqAuxiliar do
    begin
      Close;
      SQL.Add( ' SELECT NIVEL FROM USUARIOS' +
               ' WHERE ID = ' + QuotedStr(IntToStr(pCodigo)));
      Open;
      Result := FieldByName('NIVEL').AsInteger;
    end;
  finally
      FreeAndNil(dmAuxiliar);
  end;
end;

function fBuscaSaborPizzaPorCodigo(pCodigo:string):string;
begin
  try
    if not Assigned(dmAuxiliar) then
      dmAuxiliar := TdmAuxiliar.Create(Application);

    with dmAuxiliar.fdqAuxiliar do
    begin
      Close;
      SQL.Add( ' SELECT ID, DESCRICAO FROM SABORES' +
               ' WHERE ID = ' + QuotedStr(Trim(pCodigo)));
      Open;
      if not IsEmpty then
        Result := FieldByName('ID').AsString + ^I + '-' + ^I + FieldByName('DESCRICAO').AsString
      else
        if application.MessageBox(Pchar(Format(msg16,[FieldByName('ID').AsString])), aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
    end;

  finally
      FreeAndNil(dmAuxiliar);
  end;
end;

function fRetornaAutoIncrement(pTabela:string):string;
begin
  try
    if not Assigned(dmAuxiliar) then
      dmAuxiliar := TdmAuxiliar.Create(Application);

    with dmAuxiliar.fdqAuxiliar do
    begin
      Close;
      SQL.Add( ' SELECT a.AUTO_INCREMENT codigo FROM information_schema.tables a ' +
               ' WHERE a.table_name = ' + QuotedStr(Trim(pTabela)) + ' and table_schema = "pizzaria" ');
      Open;
      if not IsEmpty then
        Result :=  IntToStr(FieldByName('CODIGO').AsInteger - 1);
    end;

  finally
      FreeAndNil(dmAuxiliar);
  end;
end;

function fRegistroExiste(pTabela, pCampo, pBusca:string):Boolean;
begin
  Result := True;
  try
    try
      if not Assigned(dmAuxiliar) then
      dmAuxiliar := TdmAuxiliar.Create(Application);

      with dmAuxiliar.fdqAuxiliar do
      begin
        Close;
        SQL.Add( ' SELECT 1 FROM ' + pTabela +
                 ' WHERE ' + pCampo + ' = ' + Trim(pBusca));
        Open;
        if not IsEmpty then
        begin
          Result := False;
          if application.MessageBox(Pchar(Format(msg30,[pBusca])), aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
        end;
      end;

    except on e : Exception do
      ShowMessage(e.Message);
    end;

  finally
      FreeAndNil(dmAuxiliar);
  end;
end;

function fBuscaCaixas(pCodigo:string):string;
begin
  try
    if not Assigned(dmAuxiliar) then
      dmAuxiliar := TdmAuxiliar.Create(Application);

    with dmAuxiliar.fdqAuxiliar do
    begin
      Close;
      SQL.Add( ' SELECT ID, DESCRICAO FROM CAIXAS' +
               ' WHERE ID = ' + QuotedStr(Trim(pCodigo)));
      Open;
      if not IsEmpty then
        Result := FieldByName('ID').AsString + ' - ' + FieldByName('DESCRICAO').AsString
      else
      begin
        if application.MessageBox(Pchar(Format(msg16,[FieldByName('ID').AsString])), aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
        Result := '';
      end;
    end;

  finally
      FreeAndNil(dmAuxiliar);
  end;
end;

function fAbreCaixa(pUsuario, pCodCaixa:Integer; pValor:string):Boolean;
begin
  try
    if not Assigned(dmAuxiliar2) then
      dmAuxiliar2 := TdmAuxiliar2.Create(Application);

    with dmAuxiliar2.fdqAuxiliar2 do
    begin
      Close;
      SQL.Add('SELECT ID, STATUS FROM MOVCAIXAS ' +
              'WHERE CAIXA = ' + IntToStr(pCodCaixa) +
              ' ORDER BY ID DESC LIMIT 1');
      Open;

      if FieldByName('status').AsString <> 'A' then
      begin
        try
          if not Assigned(dmAuxiliar) then
            dmAuxiliar := TdmAuxiliar.Create(Application);

          with dmAuxiliar.fdqAuxiliar do
          begin
            Close;
            SQL.Add('INSERT INTO MOVCAIXAS(USUARIO_ABERT, VALOR_ABERT, CAIXA) ' +
                    'VALUES(' + IntToStr(pUsuario) + ','
                              + (StringReplace(pValor, ',', '.', [rfReplaceAll]))
                              + ',' + IntToStr(pCodCaixa) + ')');
            ExecSQL;
            Result := True;
          end

        finally
          FreeAndNil(dmAuxiliar);
        end;
      end
      else
      begin
        Result := False;
        if application.MessageBox(msg21, aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
      end;
    end;
  finally
      FreeAndNil(dmAuxiliar2);
  end;
end;

function fNomeComputador : string;
var
  ipbuffer : string;
  nsize    : dword;
begin
   nsize := 255;
   SetLength(ipbuffer,nsize);
   if GetComputerName(pchar(ipbuffer),nsize) then
      result := ipbuffer;
end;

function fQtdCaixasAbertos:Integer;
var
 sLcSql:string;
begin
  try
    if not Assigned(dmAuxiliar2) then
      dmAuxiliar2 := TdmAuxiliar2.Create(Application);

    with dmAuxiliar2.fdqAuxiliar2 do
    begin
      slcSql := EmptyStr;
      if fNivelUsuario(iGbCodUsuario) = 0 then
        sLcSql := ' SELECT MC.ID, C.DESCRICAO, MC.DATA_ABERT FROM MOVCAIXAS MC ' +
                  ' INNER JOIN CAIXAS C ON C.ID = MC.CAIXA ' +
                  ' WHERE STATUS = ' + QuotedStr('A')
      else
        sLcSql := ' SELECT MC.ID, C.DESCRICAO, MC.DATA_ABERT FROM MOVCAIXAS MC ' +
                  ' INNER JOIN CAIXAS C ON C.ID = MC.CAIXA ' +
                  ' WHERE STATUS = ' + QuotedStr('A') +
                  ' AND USUARIO_ABERT = ' + QuotedStr(IntToStr(iGbCodUsuario));

      Close;
      SQL.Add(sLcSql);
      Open;

      if not IsEmpty then
      begin
        Result := RecordCount;
        if RecordCount = 1 then // Somente um caixa aberto, n�o � necess�rio abrir a tela de Pesquisa de Caixas Abertos
        begin
          iGbNumCaixaAberto := FieldByName('ID').AsInteger;
          sGbDescCaixa      := FieldByName('DESCRICAO').AsString;
          sGbDtCaixaAberto  := FieldByName('DATA_ABERT').AsString;
        end;
      end
      else
        Result := 0;
    end;

  finally
    FreeAndNil(dmAuxiliar2);
  end;
end;

function fSomaValorTotalVenda(pValorUnitario, pValorTotal:Double):Double;
var
  dLcValorTotal : Double;
begin
  dLcValorTotal := (pValorTotal + pValorUnitario);
  Result := dLcValorTotal;
end;

function fVersaoExe: String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F : PFFI;
  Handle : Dword;
  Len : Longint;
  Data : Pchar;
  Buffer : Pointer;
  Tamanho : Dword;
  pArquivo: Pchar;
  Arquivo : String;
begin
  Arquivo := Application.ExeName;
  pArquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(pArquivo, Arquivo);
  Len := GetFileVersionInfoSize(pArquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data:=StrAlloc(Len+1);
    if GetFileVersionInfo(pArquivo,Handle,Len,Data) then
    begin
      VerQueryValue(Data, '\',Buffer,Tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d',
      [HiWord(F^.dwFileVersionMs),
      LoWord(F^.dwFileVersionMs),
      HiWord(F^.dwFileVersionLs),
      Loword(F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;
  StrDispose(pArquivo);
end;

function fConexaoInternet:boolean;
begin
  Result := False;
  try
    Result := InternetCheckConnection('http://www.google.com.br/', 1, 0);
  except
    on e : Exception do
      if application.MessageBox(msg27, eMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
  end;
end;
end.
