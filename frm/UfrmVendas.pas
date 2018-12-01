unit UfrmVendas;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.DBGrids, Data.DB,
  Vcl.Grids, Vcl.Mask, Vcl.Imaging.jpeg, UfrmPadrao,
  Vcl.Buttons, Vcl.Menus, Datasnap.DBClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, System.StrUtils, System.ImageList,
  Vcl.ImgList, Graphics, UfrmConfig;

type
  TfrmVendas = class(TfrmConfig)
    grpDadosCliente: TGroupBox;
    stbVendas: TStatusBar;
    imgPizza: TImage;
    pnlProdutos: TPanel;
    dbgProdutos: TDBGrid;
    btnPesqTiposPizza: TButton;
    grpTiposPizza: TGroupBox;
    grpSabores: TGroupBox;
    btnIncluirSabor: TButton;
    edtPesqCodSabores: TEdit;
    btnFormasPgto: TButton;
    btnCancelarVenda: TButton;
    btnConfirmarVenda: TButton;
    pnlImagem: TPanel;
    btnRetirarSabor: TButton;
    lstSaboresPedido: TListBox;
    edtProdutoDesc: TEdit;
    edtProdutoTamanho: TEdit;
    edtProdutoFatias: TEdit;
    edtProdutoValor: TEdit;
    lbDescricao: TLabel;
    lbTamanho: TLabel;
    lbFatias: TLabel;
    lbValor: TLabel;
    btnIncluirProdutoPedido: TButton;
    grpPedidoVenda: TGroupBox;
    dbgSaboresPizza: TDBGrid;
    grpFormasPgto: TGroupBox;
    dbgFormasPgto: TDBGrid;
    grpValorTotal: TGroupBox;
    grpValorPago: TGroupBox;
    grpTroco: TGroupBox;
    edtValorPago: TEdit;
    edtValorTroco: TEdit;
    pmExcluiProduto: TPopupMenu;
    Excluirpizza1: TMenuItem;
    dsProdutos: TDataSource;
    dsSabores: TDataSource;
    dsFormaPgto: TDataSource;
    cdsSabores: TClientDataSet;
    cdsFormaPgto: TClientDataSet;
    btnConsultaVendas: TBitBtn;
    tmrHora: TTimer;
    cdsProdutos: TClientDataSet;
    cdsProdutosdescprod: TStringField;
    cdsProdutoscodprod: TIntegerField;
    cdsProdutosordemprod: TIntegerField;
    cdsProdutosvalorprod: TCurrencyField;
    cdsProdutosvl_total: TAggregateField;
    dbedtValorTotal: TDBEdit;
    cdsFormaPgtocodformapagto: TIntegerField;
    cdsFormaPgtodescricao: TStringField;
    cdsFormaPgtovalor: TCurrencyField;
    pmExcluirFormaPgto: TPopupMenu;
    Exluir1: TMenuItem;
    cdsSaboresdescricao: TStringField;
    cdsSaborescodproduto: TStringField;
    cdsSaborescodsabor: TStringField;
    cdsSaboresordem: TStringField;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    dbedtNome: TDBEdit;
    dbedtFone: TDBEdit;
    dbedtCel: TDBEdit;
    dbedtCidade: TDBEdit;
    dbedtBairro: TDBEdit;
    dbedtRua: TDBEdit;
    dbedtCep: TDBEdit;
    dbedtNum: TDBEdit;
    dbedtComplemento: TDBEdit;
    btnCep: TBitBtn;
    grpPesqFone: TGroupBox;
    edtPesqFone: TEdit;
    grpBtnAlteracao: TGroupBox;
    btnCancelar: TButton;
    btnSalvar: TButton;
    btnAlterar: TButton;
    grpProdutoCod: TGroupBox;
    lbCod: TLabel;
    edtProdutoCod: TEdit;
    grpObsVenda: TGroupBox;
    mmObsVenda: TMemo;
    imgFone: TImage;
    dbedtCodigo: TDBEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tmrHoraTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesqTiposPizzaClick(Sender: TObject);
    procedure btnIncluirSaborClick(Sender: TObject);
    procedure btnRetirarSaborClick(Sender: TObject);
    procedure lstSaboresPedidoDblClick(Sender: TObject);
    procedure btnFormasPgtoClick(Sender: TObject);
    procedure btnEntregadorClick(Sender: TObject);
    procedure edtPesqCodSaboresKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarVendaClick(Sender: TObject);
    procedure edtValorTotalVendaKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorPagoKeyPress(Sender: TObject; var Key: Char);
    procedure Excluirpizza1Click(Sender: TObject);
    procedure btnConfirmarVendaClick(Sender: TObject);
    procedure dbgProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnConsultaVendasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exluir1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtPesqFoneKeyPress(Sender: TObject; var Key: Char);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtProdutoCodKeyPress(Sender: TObject; var Key: Char);
    procedure btnIncluirProdutoPedidoClick(Sender: TObject);
  private
    { Private declarations }
    sPvNumVenda : string;
    iPvCodCliente : Integer;
    procedure pDesabilitaLimpaTela;
    procedure pIncluirSaboresPedido(pCodTipoPizza:string);
    procedure pIncluirProduto;
    procedure pTipoSaboresPizza(pRegistro, pOrdem:string);
    procedure pExcluirTiposXSabores(pRegistro, pOrdem:string);
    procedure pConfirmaVendas;
    procedure pValidaProdutosVenda;
  public
    { Public declarations }
    sPbDataCaixaAberto : string;
    cPbValorTotal : Currency;
    procedure pIncluirFormasPagto;
    function  fPesqClienteFone(pFone:string):Boolean;
  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

uses
  UfrmPesqTipoPizza, UfrmPesqSabores, uMensagens, UfrmPesqFormasPgto, UfrmPesqEntregadores, uFuncoes,
  Vcl.Dialogs, System.Types, UfrmConsultaVendaProdutos, UdmPesqClientesVenda,
  UfrmPesqClientesVenda;

procedure TfrmVendas.btnPesqTiposPizzaClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmPesqTipoPizza) then
    frmPesqTipoPizza := TfrmPesqTipoPizza.Create(Self);
  frmPesqTipoPizza.ShowModal;
end;

procedure TfrmVendas.btnConsultaVendasClick(Sender: TObject);
begin
  inherited;

  if fNivelUsuario(iGbCodUsuario) = 0 then
    pCriarForm(TfrmConsultaVendaProdutos, frmConsultaVendaProdutos)
  else
    if application.MessageBox(msg11, aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
end;

procedure TfrmVendas.btnAlterarClick(Sender: TObject);
begin
  inherited;

  edtPesqFone.Color       := clRed;
  edtPesqFone.Enabled     := False;
  dmPesqClientesVenda.fdqryPesqClientesFone.Edit;
  grpDadosCliente.Caption := 'Cadastro de Cliente(Alterando)';
  grpDadosCliente.Enabled := True;
  btnAlterar.Enabled      := False;
  btnCancelar.Enabled     := True;
  btnSalvar.Enabled       := True;
  dbedtNome.SetFocus;
end;

procedure TfrmVendas.btnCancelarClick(Sender: TObject);
begin
  inherited;

  edtPesqFone.Color       := clWhite;
  edtPesqFone.Enabled     := True;

  dmPesqClientesVenda.fdqryPesqClientesFone.Cancel;

  grpDadosCliente.Caption := 'Cadastro de Cliente';
  grpDadosCliente.Enabled := False;
  btnAlterar.Enabled      := True;
  btnAlterar.SetFocus;
  btnCancelar.Enabled     := False;
  btnSalvar.Enabled       := False;

  if dmPesqClientesVenda.fdqryPesqClientesFone.RecordCount > 0 then
  begin
    grpProdutoCod.Enabled := True;
    if edtProdutoCod.CanFocus then
      edtProdutoCod.SetFocus;
  end
  else
  begin
    btnAlterar.Enabled := False;
    grpProdutoCod.Enabled := False;
    if edtPesqFone.CanFocus then
      edtPesqFone.SetFocus;
  end;
end;

procedure TfrmVendas.btnCancelarVendaClick(Sender: TObject);
begin
  inherited;

  if application.MessageBox (msg17, cMsg, MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    pDesabilitaLimpaTela;
  end;
end;

procedure TfrmVendas.btnConfirmarVendaClick(Sender: TObject);
begin
  inherited;

  pConfirmaVendas;

  if application.MessageBox(Pchar(Format(msg18,[sPvNumVenda])), cMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
  begin
    pDesabilitaLimpaTela;
  end;
end;

procedure TfrmVendas.btnEntregadorClick(Sender: TObject);
begin
  inherited;

  if not Assigned(frmPesqEntregadores) then
    frmPesqEntregadores := TfrmPesqEntregadores.Create(Self);
  frmPesqEntregadores.ShowModal;
end;

procedure TfrmVendas.btnFormasPgtoClick(Sender: TObject);
begin
  inherited;

  if not Assigned(frmPesqFormasPgto) then
    frmPesqFormasPgto := TfrmPesqFormasPgto.Create(Self);
  frmPesqFormasPgto.ShowModal;
end;

procedure TfrmVendas.btnIncluirProdutoPedidoClick(Sender: TObject);
begin
  inherited;

  pValidaProdutosVenda;
end;

procedure TfrmVendas.btnIncluirSaborClick(Sender: TObject);
begin
  inherited;

  if not Assigned(frmPesqSabores) then
    frmPesqSabores := TfrmPesqSabores.Create(Self);
  frmPesqSabores.ShowModal;
end;

procedure TfrmVendas.btnRetirarSaborClick(Sender: TObject);
begin
  inherited;
  lstSaboresPedido.DeleteSelected;
end;

procedure TfrmVendas.btnSalvarClick(Sender: TObject);
begin
  inherited;

  edtPesqFone.Color       := clWhite;
  edtPesqFone.Enabled     := True;

  dmPesqClientesVenda.fdqryPesqClientesFone.Post;

  grpDadosCliente.Caption := 'Cadastro de Cliente';
  grpDadosCliente.Enabled := False;
  btnAlterar.Enabled      := True;
  btnCancelar.Enabled     := False;
  btnSalvar.Enabled       := False;

  if dmPesqClientesVenda.fdqryPesqClientesFone.RecordCount > 0 then
  begin
    grpProdutoCod.Enabled := True;
    if edtProdutoCod.CanFocus then
      edtProdutoCod.SetFocus;
  end
  else
  begin
    btnAlterar.Enabled := False;
    grpProdutoCod.Enabled := False;
    if edtPesqFone.CanFocus then
      edtPesqFone.SetFocus;
  end;
end;

procedure TfrmVendas.dbgProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if (gdSelected in State) then
    pTipoSaboresPizza(cdsProdutos.FieldByName('codprod').AsString,
                      cdsProdutos.FieldByName('ordemprod').AsString);
end;

procedure TfrmVendas.pDesabilitaLimpaTela;
begin
  edtPesqFone.Clear;
  edtProdutoCod.Clear;
  edtProdutoDesc.Clear;
  edtProdutoTamanho.Clear;
  edtProdutoFatias.Clear;
  edtProdutoValor.Clear;
  btnPesqTiposPizza.Enabled       := False;
  edtPesqCodSabores.Clear;
  edtPesqCodSabores.Enabled       := False;
  btnIncluirSabor.Enabled         := False;
  btnRetirarSabor.Enabled         := False;
  lstSaboresPedido.Clear;
  grpPedidoVenda.Enabled          := False;
  btnIncluirProdutoPedido.Enabled := False;
  btnFormasPgto.Enabled           := False;
  btnCancelarVenda.Enabled        := False;
  edtValorPago.Text               := '0,00';
  edtValorTroco.Text              := '0,00';
  mmObsVenda.Enabled              := False;
  mmObsVenda.Clear;
  btnConfirmarVenda.Enabled       := False;
  btnConsultaVendas.Enabled       := True;
  if cdsProdutos.Active then
  begin
    cdsProdutos.EmptyDataSet;
    cdsProdutos.Close;
  end;
  if cdsSabores.Active then
  begin
    cdsSabores.EmptyDataSet;
    cdsSabores.Close;
  end;
  if cdsFormaPgto.Active then
  begin
    cdsFormaPgto.EmptyDataSet;
    cdsFormaPgto.Close;
  end;
  if dmPesqClientesVenda.fdqryPesqClientesFone.Active then
  begin
    dmPesqClientesVenda.fdqryPesqClientesFone.EmptyDataSet;
    dmPesqClientesVenda.fdqryPesqClientesFone.Close;
  end;
  iGbOrdem                        := 0;
  sPvNumVenda                     := '';
  iPvCodCliente                   := 0;
  sGbCodEntregador                := '';
  stbVendas.Panels[4].Text        := '';
  if edtPesqFone.CanFocus then
    edtPesqFone.SetFocus;
end;

procedure TfrmVendas.edtPesqCodSaboresKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    if not Trim(edtPesqCodSabores.Text).IsEmpty then
    begin
      if not fBuscaSaborPizzaPorCodigo(edtPesqCodSabores.Text).IsEmpty then
        lstSaboresPedido.Items.Add(fBuscaSaborPizzaPorCodigo(edtPesqCodSabores.Text));
      edtPesqCodSabores.Clear;
      edtPesqCodSabores.SetFocus;
    end;
  end;
end;

procedure TfrmVendas.edtPesqFoneKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if Key = #13 then
  begin
    if not Trim(edtPesqFone.Text).IsEmpty then
    begin
      if fPesqClienteFone(Trim(edtPesqFone.Text)) then
      begin
        btnAlterar.Enabled        := True;
        grpProdutoCod.Enabled     := True;
        btnPesqTiposPizza.Enabled := True;
        if edtProdutoCod.CanFocus then
          edtProdutoCod.SetFocus;
      end
      else
      begin
        if application.MessageBox(Pchar(Format(msg16 + ' Cadastrar?',['telefone:' + edtpesqFone.Text])), aMsg, MB_YESNO + MB_ICONINFORMATION) = IDYES then
        begin
          edtPesqFone.Color       := clRed;
          edtPesqFone.Enabled     := False;
          grpDadosCliente.Caption := 'Cadastro de Cliente(Incluíndo)';
          dmPesqClientesVenda.fdqryPesqClientesFone.Insert;
          grpDadosCliente.Enabled := True;
          btnAlterar.Enabled      := False;
          btnCancelar.Enabled     := True;
          btnSalvar.Enabled       := True;
          dbedtFone.Text          := edtPesqFone.Text;
          dbedtCel.Text           := edtPesqFone.Text;
          dbedtNome.SetFocus;
        end
        else
        begin
          grpDadosCliente.Enabled := False;
          edtPesqFone.Clear;
          edtPesqFone.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TfrmVendas.edtProdutoCodKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if Key = #13 then
  begin
    if not Trim(edtProdutoCod.Text).IsEmpty then
    begin
      pBuscaProdutoPorCodigo(edtProdutoCod.Text, edtProdutoCod, edtProdutoDesc,
                             edtProdutoTamanho, edtProdutoFatias, edtProdutoValor);

      frmVendas.btnIncluirProdutoPedido.Enabled := True;
      frmVendas.grpPedidoVenda.Enabled          := True;

      if sGbTipoProd = 'P' then
      begin
        edtPesqCodSabores.Enabled     := True;
        edtPesqCodSabores.SetFocus;
        btnIncluirSabor.Enabled       := True;
        btnRetirarSabor.Enabled       := True;
      end
      else
      begin
        edtPesqCodSabores.Enabled := False;
        btnIncluirSabor.Enabled   := False;
        btnRetirarSabor.Enabled   := False;
        btnIncluirProdutoPedido.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmVendas.edtValorPagoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if not CharInSet(Key,[#08,#13,#44,'0'..'9']) then
    key:=#0;
end;

procedure TfrmVendas.edtValorTotalVendaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key,['0'..'9' ,#44 ,#08])then
    key:=#0;
end;

procedure TfrmVendas.Excluirpizza1Click(Sender: TObject);
begin
  inherited;
  with  cdsProdutos do
  begin
    if not IsEmpty then
    begin
      pExcluirTiposXSabores(FieldByName('codprod').AsString, FieldByName('ordemprod').AsString);

      if cdsFormaPgto.Active then
        cdsFormaPgto.EmptyDataSet;

      edtValorPago.Text  := '0,00';
      edtValorTroco.Text := '0,00';

      Delete;
    end;
  end;

  btnConfirmarVenda.Enabled := False;

  if edtProdutoCod.CanFocus then
      edtProdutoCod.SetFocus;

end;

procedure TfrmVendas.Exluir1Click(Sender: TObject);
begin
  inherited;

  with cdsFormaPgto do
  begin
    if not IsEmpty then
      Delete;
  end;
end;

procedure TfrmVendas.pExcluirTiposXSabores(pRegistro, pOrdem : string);
begin
  with cdsSabores do
  begin
    Filtered := false;
    Filter   := 'codproduto = ' + QuotedStr(pRegistro) + ' and ordem = ' + QuotedStr(pOrdem);
    Filtered := true;
    if not IsEmpty then
    begin
      First;
      while not eof do
      begin
        Delete;
        Next;
      end;
    end;
    Filtered := false;
  end;
end;

procedure TfrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  iGbNumCaixaAberto := 0;

end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
  inherited;

  if not Assigned(dmPesqClientesVenda) then
    dmPesqClientesVenda := TdmPesqClientesVenda.Create(Self);

end;

procedure TfrmVendas.FormDestroy(Sender: TObject);
begin
  inherited;

  FreeAndNil(dmPesqClientesVenda);
end;

procedure TfrmVendas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_F2 then
  begin
    pCriarForm(TfrmPesqClientesVendas, frmPesqClientesVendas);
  end;

  if Key = VK_F4 then
  begin
    if btnPesqTiposPizza.CanFocus then
      btnPesqTiposPizzaClick(Sender);
  end;


  if Key = VK_F6 then
  begin
    if btnIncluirProdutoPedido.CanFocus then
      btnIncluirProdutoPedidoClick(Sender);
  end;

  if Key = VK_F7 then
  begin
    if btnFormasPgto.CanFocus then
      btnFormasPgtoClick(Sender);
  end;

  if Key = VK_F8 then
  begin
    if btnCancelarVenda.CanFocus then
      btnCancelarVendaClick(Sender);
  end;

  if Key = VK_F9 then
  begin
    if btnConfirmarVenda.CanFocus then
      btnConfirmarVendaClick(Sender);
  end;

  if Key = VK_F10 then
  begin
    if btnConsultaVendas.CanFocus then
      btnConsultaVendasClick(Sender);
  end;

end;

procedure TfrmVendas.FormShow(Sender: TObject);
begin
  inherited;

  stbVendas.Panels[0].Text := ' Data: ' + DateToStr(Date);
  stbVendas.Panels[2].Text := 'Caixa Aberto(Número: ' + IntToStr(iGbNumCaixaAberto) + ' - Data: ' + sGbDtCaixaAberto + ')';
  stbVendas.Panels[3].Text := 'Caixa Operador: '      + sGbUsuarioLogado;
  Caption                  :=  Caption + ' - Caixa Aberto(Número: ' + IntToStr(iGbNumCaixaAberto) + ' - Data: ' + sGbDtCaixaAberto + ')';

  sPbDataCaixaAberto := Copy(sGbDtCaixaAberto, 7, 4) + '.' + Copy(sGbDtCaixaAberto, 4, 2) + '.' +
                        Copy(sGbDtCaixaAberto, 1, 2) + ' ' + Copy(sGbDtCaixaAberto, 12, 8);
end;

procedure TfrmVendas.pIncluirFormasPagto;
begin
  with cdsFormaPgto do
  begin
    if not Active then
       CreateDataSet;
  end;
end;

procedure TfrmVendas.pIncluirSaboresPedido(pCodTipoPizza:string);
var
  i:Integer;
  codSaborPizza, descSaborPizza : string;
begin
  with cdsSabores do
  begin
     if not Active then
       CreateDataSet;

    for i := 0 to Pred(lstSaboresPedido.Count) do
    begin
      codSaborPizza  := SplitString(lstSaboresPedido.Items.Strings[i], '-')[0];
      descSaborPizza := SplitString(lstSaboresPedido.Items.Strings[i], '-')[1];

      Append;
      FieldByName('codproduto').AsString := Trim(pCodTipoPizza);
      FieldByName('codsabor').AsString   := Trim(codSaborPizza);
      FieldByName('descricao').AsString  := Trim(descSaborPizza);
      FieldByName('ordem').AsInteger     := iGbOrdem;
      Post;
    end;
  end;
end;

function TfrmVendas.fPesqClienteFone(pFone: string):Boolean;
begin
  with dmPesqClientesVenda.fdqryPesqClientesFone do
  begin
    Close;
    Params.ParamByName('pFone').AsString := pFone;
    Open;
    if not IsEmpty then
      Result := True
    else
      Result := False;
  end;

end;

procedure TfrmVendas.pIncluirProduto;
begin
  with cdsProdutos do
  begin
   if not Active then
     CreateDataSet;
   Append;
   FieldByName('codprod').AsString    := Trim(edtProdutoCod.Text);
   FieldByName('descprod').AsString   := edtProdutoDesc.Text;
   FieldByName('valorprod').Asstring  := edtProdutoValor.Text;
   FieldByName('ordemprod').AsInteger := iGbOrdem;
   Post;
  end;
end;

procedure TfrmVendas.lstSaboresPedidoDblClick(Sender: TObject);
begin
  inherited;
  lstSaboresPedido.DeleteSelected;
end;

procedure TfrmVendas.pTipoSaboresPizza(pRegistro, pOrdem: string);
begin
  cdsSabores.Filtered := false;
  cdsSabores.Filter   := 'codproduto = ' + QuotedStr(pRegistro) + ' and ordem = ' + QuotedStr(pOrdem);
  cdsSabores.Filtered := true;
end;

procedure TfrmVendas.pValidaProdutosVenda;
begin
  if sGbTipoProd = Trim('P') then
  begin
    if lstSaboresPedido.Items.Count > 0 then
    begin
      pIncluirProduto;
      pIncluirSaboresPedido(cdsProdutos.FieldByName('codprod').AsString);
    end
    else
    begin
      if application.MessageBox (msg15, aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
        btnIncluirSabor.SetFocus;
      Abort;
    end;
  end
  else
  begin
    pIncluirProduto;
  end;

  btnFormasPgto.Enabled      := True;
  btnCancelarVenda.Enabled   := True;
  dbedtValorTotal.Enabled    := True;
  mmObsVenda.Enabled         := True;

  dbgProdutos.Refresh;
  edtProdutoCod.Clear;
  edtProdutoDesc.Clear;
  edtProdutoTamanho.Clear;
  edtProdutoFatias.Clear;
  edtProdutoValor.Clear;
  lstSaboresPedido.Clear;
  Inc(iGbOrdem);
  edtPesqCodSabores.Enabled       := False;
  btnIncluirSabor.Enabled         := False;
  btnRetirarSabor.Enabled         := False;
  btnIncluirProdutoPedido.Enabled := False;
  btnConsultaVendas.Enabled       := False;

  if edtProdutoCod.CanFocus then
    edtProdutoCod.SetFocus;
end;

procedure TfrmVendas.pConfirmaVendas;
var
  sLcSql,
  sLcCodProd,
  sLcOrdem,
  sLcCodSabor,
  sLcCodFormaPagto,
  sLcValor : string;
begin

  sLcSql := '';
  iPvCodCliente := StrToInt(dbedtCodigo.Text);

  // Grava Cabeçalho da Venda.
  if sGbCodEntregador.IsEmpty then
    sLcSql := 'INSERT INTO VENDAS(NUMCAIXA, CODUSUARIO, CODCLIENTE, OBS) ' +
              'VALUES(' + IntToStr(iGbNumCaixaAberto) + ', ' +  IntToStr(iGbCodUsuario) + ', '
                        + IntToStr(iPvCodCliente) + ', ' + QuotedStr(mmObsVenda.Lines.Text) + ')'
  else
    sLcSql := 'INSERT INTO VENDAS(NUMCAIXA, CODUSUARIO, CODCLIENTE, CODENTREGADOR, OBS) ' +
              'VALUES(' + IntToStr(iGbNumCaixaAberto) + ', ' +  IntToStr(iGbCodUsuario) + ', '
                        + IntToStr(iPvCodCliente) + ', ' +  sGbCodEntregador + ', ' + QuotedStr(mmObsVenda.Lines.Text) + ')';

  pExecutaSqlInsertUpDate(sLcSql);

  sPvNumVenda := fRetornaAutoIncrement('vendas');

  // Grava Produtos da Venda.
  sLcSql := '';
  with cdsProdutos do
  begin
    First;
    while not eof do
    begin
      sLcCodProd := FieldByName('codprod').AsString;
      sLcOrdem   := FieldByName('ordemprod').AsString;

      sLcSql := 'INSERT INTO VENDASPRODUTOS(NUMVENDA, CODPRODUTO, ORDEM) ' +
                'VALUES(' + sPvNumVenda + ',' +  sLcCodProd + ', ' + sLcOrdem + ')';
      pExecutaSqlInsertUpDate(sLcSql);

      // Grava Pizza Sabores.
      sLcSql := '';
      with cdsSabores do
      begin
        if not IsEmpty then
        begin
          Filtered := false;
          Filter   := 'codproduto = ' + QuotedStr(sLcCodProd) + ' and ordem = ' + QuotedStr(sLcOrdem);
          Filtered := true;
          if not IsEmpty then
          begin
            First;
            while not eof do
            begin
              sLcCodProd  := FieldByName('codproduto').AsString;
              sLcCodSabor := FieldByName('codsabor').AsString;
              sLcOrdem    := FieldByName('ordem').AsString;

              sLcSql := 'INSERT INTO VENDASPIZZASABORES(NUMVENDA, CODPRODUTO, CODSABOR, ORDEM) ' +
                        'VALUES(' + sPvNumVenda + ',' +  sLcCodProd + ', '
                                  + sLcCodSabor + ',' + sLcOrdem + ')';
              pExecutaSqlInsertUpDate(sLcSql);

              Next;
            end;
          end;
        end;
      end;

      Next;
    end;
  end;

  // Grava Formas Pagto Venda.
  sLcSql := '';
  with cdsFormaPgto do
  begin
    First;
    while not eof do
    begin
      sLcCodFormaPagto  := FieldByName('codformapagto').AsString;
      sLcValor          := FormatFloat('#####0.00', (FieldByName('valor').AsCurrency));
      sLcValor          := StringReplace(sLcValor, ',', '.', [rfReplaceAll]);

      sLcSql := 'INSERT INTO VENDASFORMAPGTO(NUMVENDA, CODFORMAPGTO, VALOR) ' +
                'VALUES(' + sPvNumVenda + ',' +  sLcCodFormaPagto + ',' + sLcValor + ')';
      pExecutaSqlInsertUpDate(sLcSql);

      Next;
    end;
  end;

end;

procedure TfrmVendas.tmrHoraTimer(Sender: TObject);
begin
  inherited;

  Application.ProcessMessages;
  stbVendas.Panels[1].Text := ' Hora: ' + FormatDateTime('hh:mm:ss', Time);
end;

end.


