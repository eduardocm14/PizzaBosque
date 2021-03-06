unit UfrmConsultaVendaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmPadrao, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.DBCtrls, Vcl.ExtCtrls, FireDAC.Stan.Param,
  Vcl.Mask;

type
  TfrmConsultaVendaProdutos = class(TfrmPadrao)
    pgcConsultaVendas: TPageControl;
    tabVendasEfetivadas: TTabSheet;
    grpVendaEfetivadas: TGroupBox;
    lblCaixaCodDesc: TLabel;
    Label1: TLabel;
    dbgVendas: TDBGrid;
    grpObsVenda: TGroupBox;
    dbmmObsVendas: TDBMemo;
    dbgVendasProdutos: TDBGrid;
    dbgVendasPgto: TDBGrid;
    gbxTotalFormaPagto: TGroupBox;
    lbTotalGeral: TLabel;
    dbgTotalFormaPgto: TDBGrid;
    dbedtTotalGeral: TDBEdit;
    pmOpcao: TPopupMenu;
    InclurEntregador1: TMenuItem;
    N1: TMenuItem;
    CancelarVenda1: TMenuItem;
    tabVendasCanceladas: TTabSheet;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    lblCaixaCodDescCanc: TLabel;
    dbedtTotalCancelado: TDBEdit;
    GroupBox2: TGroupBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dbgVendasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure InclurEntregador1Click(Sender: TObject);
    procedure CancelarVenda1Click(Sender: TObject);
    procedure pgcConsultaVendasChange(Sender: TObject);
  private
    { Private declarations }
    procedure pConsultaVendasCabecalho(pNumCaixa, pData1, pData2:string);
    procedure pTotalFormaPagto(pNumCaixa, pData1, pData2:string);
    procedure pVendasProdutos;
    procedure pVendasPagto;
    procedure pConsultaVendasCanceladas(pNumCaixa, pData1, pData2:string);
  public
    { Public declarations }
  end;

var
  frmConsultaVendaProdutos: TfrmConsultaVendaProdutos;

implementation

{$R *.dfm}

uses UfrmVendas, uFuncoes, UdmConsultaVendaProdutos, UdmConsultaFechaCaixas,
  UfrmPesqEntregadores, uMensagens;

procedure TfrmConsultaVendaProdutos.CancelarVenda1Click(Sender: TObject);
begin
  inherited;

  if application.MessageBox(Pchar(Format(msg28,[dmConsultaVendaProdutos.fdqConsultaVendasid.AsString])), cMsg, MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    with dmConsultaVendaProdutos.fdqConsultaVendas do
    begin
      Edit;
      FieldByName('status').AsString := 'C';
      Post;
      Refresh;
    end;

    pConsultaVendasCabecalho(dmConsultaFechaCaixas.fdqConsultaFechaCaixasid.AsString,
                             sGbConsultaVendasDataInicio, sGbConsultaVendasDataFim);

    pTotalFormaPagto(dmConsultaFechaCaixas.fdqConsultaFechaCaixasid.AsString,
                     sGbConsultaVendasDataInicio, sGbConsultaVendasDataFim);
  end;
end;

procedure TfrmConsultaVendaProdutos.dbgVendasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if (gdSelected in State) then
  begin
    pVendasProdutos;
    pVendasPagto;

    if dmConsultaVendaProdutos.fdqConsultaVendasstatus.AsString = '' then

  end;

end;

procedure TfrmConsultaVendaProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action                   := caFree;
  frmConsultaVendaProdutos := nil;
end;

procedure TfrmConsultaVendaProdutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;

  dmConsultaVendaProdutos.fdqConsultaVendas.Close;
end;

procedure TfrmConsultaVendaProdutos.FormCreate(Sender: TObject);
begin
  inherited;

  if not Assigned(dmConsultaVendaProdutos) then
    dmConsultaVendaProdutos := TdmConsultaVendaProdutos.Create(Self);
end;

procedure TfrmConsultaVendaProdutos.FormDestroy(Sender: TObject);
begin
  inherited;

  FreeAndNil(dmConsultaVendaProdutos);
end;

procedure TfrmConsultaVendaProdutos.FormShow(Sender: TObject);
begin
  inherited;

  pgcConsultaVendas.TabIndex := 0;

  if not Assigned(frmVendas) then
  begin
    lblCaixaCodDesc.Caption     := '[' + dmConsultaFechaCaixas.fdqConsultaFechaCaixasid.AsString + '] ' +
                                   '[' + dmConsultaFechaCaixas.fdqConsultaFechaCaixascaixa_desc.AsString + '] ' +
                                   '[' + dmConsultaFechaCaixas.fdqConsultaFechaCaixasdata_abert.AsString + '] ';
    lblCaixaCodDescCanc.Caption := lblCaixaCodDesc.Caption;

    pConsultaVendasCabecalho(dmConsultaFechaCaixas.fdqConsultaFechaCaixasid.AsString,
                             sGbConsultaVendasDataInicio, sGbConsultaVendasDataFim);
    pTotalFormaPagto(dmConsultaFechaCaixas.fdqConsultaFechaCaixasid.AsString,
                     sGbConsultaVendasDataInicio, sGbConsultaVendasDataFim);

    if sGbCxAbertFechado = 'A' then
      dbgVendas.PopupMenu := pmOpcao;
  end
  else
  begin
    lblCaixaCodDesc.Caption     := '[' + IntToStr(iGbNumCaixaAberto) + '] [' + sGbDescCaixa + '] [' + sGbDtCaixaAberto + '] ';
    lblCaixaCodDescCanc.Caption := lblCaixaCodDesc.Caption;
    pConsultaVendasCabecalho(IntToStr(iGbNumCaixaAberto), frmVendas.sPbDataCaixaAberto,
                             FormatDateTime('yyyy.mm.dd', Now) + ' ' + FormatDateTime('hh.mm.ss', Now));
    pTotalFormaPagto(IntToStr(iGbNumCaixaAberto), frmVendas.sPbDataCaixaAberto,
                     FormatDateTime('yyyy.mm.dd', Now) + ' ' + FormatDateTime('hh.mm.ss', Now));
    dbgVendas.PopupMenu := pmOpcao;
  end;

end;

procedure TfrmConsultaVendaProdutos.InclurEntregador1Click(Sender: TObject);
begin
  inherited;

  if not Assigned(frmPesqEntregadores) then
    frmPesqEntregadores := TfrmPesqEntregadores.Create(Self);
  frmPesqEntregadores.ShowModal;

  if not Trim(sGbCodEntregador).IsEmpty then
  begin
    with dmConsultaVendaProdutos.fdqConsultaVendas do
    begin
      Edit;
      FieldByName('codentregador').AsString := sGbCodEntregador;
      Post;
      Refresh;
    end;
  end;
end;

procedure TfrmConsultaVendaProdutos.pgcConsultaVendasChange(Sender: TObject);
begin
  inherited;

   if pgcConsultaVendas.TabIndex = 1 then
   begin
     if not Assigned(frmVendas) then
       pConsultaVendasCanceladas(dmConsultaFechaCaixas.fdqConsultaFechaCaixasid.AsString,
                                 sGbConsultaVendasDataInicio, sGbConsultaVendasDataFim)
     else
       pConsultaVendasCanceladas(IntToStr(iGbNumCaixaAberto), frmVendas.sPbDataCaixaAberto,
                                 FormatDateTime('yyyy.mm.dd', Now) + ' ' + FormatDateTime('hh.mm.ss', Now));
   end;
end;

procedure TfrmConsultaVendaProdutos.pConsultaVendasCabecalho(pNumCaixa, pData1, pData2:string);
begin
  with dmConsultaVendaProdutos.fdqConsultaVendas do
  begin
    Close;
    Params.ParamByName('pNumCaixa').AsString := pNumCaixa;
    Params.ParamByName('pData1').AsString    := pData1;
    Params.ParamByName('pData2').AsString    := pData2;
    Open;
  end;
end;

procedure TfrmConsultaVendaProdutos.pConsultaVendasCanceladas(pNumCaixa, pData1,
  pData2: string);
begin
  with dmConsultaVendaProdutos.fdqConsultaVendasCanceladas do
  begin
    Close;
    Params.ParamByName('pNumCaixa').AsString := pNumCaixa;
    Params.ParamByName('pData1').AsString    := pData1;
    Params.ParamByName('pData2').AsString    := pData2;
    Open;
  end;
end;

procedure TfrmConsultaVendaProdutos.pTotalFormaPagto(pNumCaixa, pData1, pData2:string);
begin
  with dmConsultaVendaProdutos.fdqTotalFormaPagto do
  begin
    Close;
    Params.ParamByName('pNumCaixa').AsString := pNumCaixa;
    Params.ParamByName('pData1').AsString    := pData1;
    Params.ParamByName('pData2').AsString    := pData2;
    Open;
  end;
end;

procedure TfrmConsultaVendaProdutos.pVendasPagto;
begin
  with dmConsultaVendaProdutos.fdqVendasPgto do
  begin
    Close;
    Params.ParamByName('pVenda').AsString := dmConsultaVendaProdutos.fdqConsultaVendasid.AsString;
    Open;
  end;
end;

procedure TfrmConsultaVendaProdutos.pVendasProdutos;
begin
  with dmConsultaVendaProdutos.fdqVendasProdutos do
  begin
    Close;
    Params.ParamByName('pVenda').AsString := dmConsultaVendaProdutos.fdqConsultaVendasid.AsString;
    Open;
  end;
end;

end.
