unit UfrmPesqFormasPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Datasnap.DBClient,
  Vcl.Menus, Vcl.Buttons;

type
  TfrmPesqFormasPgto = class(TForm)
    edtPesquisar: TEdit;
    pnlPesquisar: TPanel;
    dbgPesqRegistros: TDBGrid;
    grpPesquisar: TGroupBox;
    gbxSelGeral: TGroupBox;
    grpValorPago: TGroupBox;
    gbxSelFormaPagto: TGroupBox;
    btnConfirma: TButton;
    grpValorTotal: TGroupBox;
    edtValorTotal: TEdit;
    btnIncluirPagto: TButton;
    dbgFormasPgtoSelecionados: TDBGrid;
    btnCancelar: TButton;
    cdsFormaPgto: TClientDataSet;
    dsFormaPgto: TDataSource;
    edtValorPago: TEdit;
    pmExcluir: TPopupMenu;
    Exluir1: TMenuItem;
    edtFormaPagtoCod: TEdit;
    edtFormaPagtoDesc: TEdit;
    gbxValorPago: TGroupBox;
    btnSete: TBitBtn;
    btnOito: TBitBtn;
    btnNove: TBitBtn;
    btnQuatro: TBitBtn;
    btnCinco: TBitBtn;
    btnSeis: TBitBtn;
    btnTres: TBitBtn;
    btnDois: TBitBtn;
    btnUm: TBitBtn;
    btnLimpar: TBitBtn;
    btnZero: TBitBtn;
    btnVirgula: TBitBtn;
    cdsFormaPgtocodformapagto: TIntegerField;
    cdsFormaPgtodescricao: TStringField;
    cdsFormaPgtovalor: TCurrencyField;
    cdsFormaPgtovl_total: TAggregateField;
    btnLimpaPesq: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPesqRegistrosKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmaClick(Sender: TObject);
    procedure dbgPesqRegistrosDblClick(Sender: TObject);
    procedure edtValorPagoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorPagoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirPagtoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Exluir1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSeteClick(Sender: TObject);
    procedure btnOitoClick(Sender: TObject);
    procedure btnNoveClick(Sender: TObject);
    procedure btnQuatroClick(Sender: TObject);
    procedure btnCincoClick(Sender: TObject);
    procedure btnSeisClick(Sender: TObject);
    procedure btnUmClick(Sender: TObject);
    procedure btnDoisClick(Sender: TObject);
    procedure btnTresClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnZeroClick(Sender: TObject);
    procedure btnVirgulaClick(Sender: TObject);
    procedure btnLimpaPesqClick(Sender: TObject);
  private
    { Private declarations }
    procedure pSelecionaFormaPagto;
    procedure pAddFieldscdsFormaPgto;
    procedure pIncluirFormasPagto(pId:Integer;pDescricao:string;pValor:Double);
  public
    { Public declarations }
  end;

var
  frmPesqFormasPgto: TfrmPesqFormasPgto;

implementation

{$R *.dfm}

uses uFuncoes, UfrmVendas, UdmFormaPgto;

procedure TfrmPesqFormasPgto.pAddFieldscdsFormaPgto;
begin
  with cdsFormaPgto do
  begin
    if not Active then
       CreateDataSet;
  end;

end;

procedure TfrmPesqFormasPgto.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesqFormasPgto.btnCincoClick(Sender: TObject);
begin
  edtValorPago.Text := Trim(edtValorPago.Text) + btnCinco.Caption;
end;

procedure TfrmPesqFormasPgto.btnConfirmaClick(Sender: TObject);
begin
  frmVendas.edtValorPago.Text            := edtValorPago.Text;
  frmVendas.edtValorTroco.Text           := FormatCurr('#####0.00', (StrToCurr(edtValorPago.Text) - StrToCurr(edtValorTotal.Text)));
  frmVendas.cdsFormaPgto.Data            := cdsFormaPgto.Data;
  frmVendas.btnConfirmarVenda.Enabled    := True;
  if frmVendas.mmObsVenda.CanFocus then
    frmVendas.mmObsVenda.SetFocus;
  Close;
end;

procedure TfrmPesqFormasPgto.btnDoisClick(Sender: TObject);
begin
  if edtValorPago.CanFocus then
    edtValorPago.Text := Trim(edtValorPago.Text) + btnDois.Caption;
end;

procedure TfrmPesqFormasPgto.btnIncluirPagtoClick(Sender: TObject);
var
  cPvValorTotal : Currency;
begin
  if StrToCurr(edtValorPago.Text) < StrToCurr(edtValorTotal.Text) then
    pIncluirFormasPagto(StrToInt(edtFormaPagtoCod.Text), edtFormaPagtoDesc.Text, StrToCurr(edtValorPago.Text))
  else
    pIncluirFormasPagto(StrToInt(edtFormaPagtoCod.Text), edtFormaPagtoDesc.Text, StrToCurr(edtValorTotal.Text));

  cPvValorTotal := cdsFormaPgto.AggFields.FieldByName('vl_total').Value;

  if cPvValorTotal < StrToCurr(edtValorTotal.Text) then
  begin
    grpValorPago.Caption := 'Faltam(R$)';
    edtValorPago.Text    := (FormatFloat('#####0.00', (StrToCurr(edtValorTotal.Text) - cPvValorTotal)));
    dbgPesqRegistros.SetFocus;
  end
  else
  begin
    grpValorPago.Caption := 'Valor Pago(R$)';
    if cdsFormaPgto.RecordCount = 1 then
      edtValorPago.Text  := FormatFloat('#####0.00', (StrToCurr(edtValorPago.Text)))
    else
      edtValorPago.Text  := FormatFloat('#####0.00', (StrToCurr(edtValorTotal.Text)));

    dbgPesqRegistros.Enabled := False;
    btnConfirma.Enabled      := True;
    btnConfirma.SetFocus;
  end;

  edtFormaPagtoCod.Clear;
  edtFormaPagtoDesc.Clear;
  grpValorPago.Enabled := False;

  btnIncluirPagto.Enabled := False;
end;

procedure TfrmPesqFormasPgto.btnLimpaPesqClick(Sender: TObject);
begin
  edtPesquisar.Clear;
  pPesqLocate(dmFormaPgto.fdqryFormaPgto, edtPesquisar, 'descricao');
  edtPesquisar.SetFocus;
end;

procedure TfrmPesqFormasPgto.btnLimparClick(Sender: TObject);
begin
  if edtValorPago.CanFocus then
  begin
    edtValorPago.Clear;
    edtValorPago.SetFocus;
  end;
end;

procedure TfrmPesqFormasPgto.btnNoveClick(Sender: TObject);
begin
  edtValorPago.Text := Trim(edtValorPago.Text) + btnNove.Caption;
end;

procedure TfrmPesqFormasPgto.btnOitoClick(Sender: TObject);
begin
  edtValorPago.Text := Trim(edtValorPago.Text) + btnOito.Caption;
end;

procedure TfrmPesqFormasPgto.btnQuatroClick(Sender: TObject);
begin
  edtValorPago.Text := Trim(edtValorPago.Text) + btnQuatro.Caption;
end;

procedure TfrmPesqFormasPgto.btnSeisClick(Sender: TObject);
begin
  edtValorPago.Text := Trim(edtValorPago.Text) + btnSeis.Caption;
end;

procedure TfrmPesqFormasPgto.btnSeteClick(Sender: TObject);
begin
  edtValorPago.Text := Trim(edtValorPago.Text) + btnSete.Caption;
end;

procedure TfrmPesqFormasPgto.btnTresClick(Sender: TObject);
begin
  if edtValorPago.CanFocus then
    edtValorPago.Text := Trim(edtValorPago.Text) + btnTres.Caption;
end;

procedure TfrmPesqFormasPgto.btnUmClick(Sender: TObject);
begin
  if edtValorPago.CanFocus then
    edtValorPago.Text := Trim(edtValorPago.Text) + btnUm.Caption;
end;

procedure TfrmPesqFormasPgto.btnVirgulaClick(Sender: TObject);
begin
  if edtValorPago.CanFocus then
    edtValorPago.Text := Trim(edtValorPago.Text) + btnVirgula.Caption;
end;

procedure TfrmPesqFormasPgto.btnZeroClick(Sender: TObject);
begin
  if edtValorPago.CanFocus then
    edtValorPago.Text := Trim(edtValorPago.Text) + btnZero.Caption;
end;

procedure TfrmPesqFormasPgto.dbgPesqRegistrosDblClick(Sender: TObject);
begin
  pSelecionaFormaPagto;
end;

procedure TfrmPesqFormasPgto.dbgPesqRegistrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    pSelecionaFormaPagto;
end;

procedure TfrmPesqFormasPgto.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  pPesqLocate(dmFormaPgto.fdqryFormaPgto, edtPesquisar, 'descricao');
end;

procedure TfrmPesqFormasPgto.edtValorPagoChange(Sender: TObject);
begin
  // Estilo caixa de banco
  pFormataValor(edtValorPago);
end;

procedure TfrmPesqFormasPgto.edtValorPagoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet(Key,['0'..'9', #8, #9]) then
    key:=#0;

  //Fun��o para posicionar o cursor sempre na direita
  edtValorPago.selstart := Length(edtValorPago.text);
end;

procedure TfrmPesqFormasPgto.Exluir1Click(Sender: TObject);
var
  cLcValorPago : Currency;
begin
  with  cdsFormaPgto do
  begin
    if not IsEmpty then
    begin
      cLcValorPago := FieldByName('valor').AsCurrency;
      Delete;
      if IsEmpty then
      begin
        grpValorPago.Caption := 'Valor Pagar(R$)';
        edtValorPago.Text    := FormatFloat('#####0.00', (StrToCurr(edtValorTotal.Text)));
      end
      else
      begin
        grpValorPago.Caption := 'Faltam(R$)';
        edtValorPago.Text    := (FormatFloat('#####0.00', (cLcValorPago)));
      end;
      btnIncluirPagto.Enabled  := False;
      btnConfirma.Enabled      := False;
      dbgPesqRegistros.Enabled := True;
      dbgPesqRegistros.SetFocus;
    end;
  end;
end;

procedure TfrmPesqFormasPgto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPesqFormasPgto := nil;
end;

procedure TfrmPesqFormasPgto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmFormaPgto.fdqryFormaPgto.Close;
end;

procedure TfrmPesqFormasPgto.FormCreate(Sender: TObject);
begin
  if not Assigned(dmFormaPgto) then
    dmFormaPgto := TdmFormaPgto.Create(Self);
  dmFormaPgto.fdqryFormaPgto.Open;
end;

procedure TfrmPesqFormasPgto.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmFormaPgto);
end;

procedure TfrmPesqFormasPgto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then
    btnConfirmaClick(Sender);
end;

procedure TfrmPesqFormasPgto.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
    Close;
end;

procedure TfrmPesqFormasPgto.FormShow(Sender: TObject);
begin
  edtValorPago.Text  := frmVendas.dbedtValorTotal.Text;
  edtValorTotal.Text := frmVendas.dbedtValorTotal.Text;
end;

procedure TfrmPesqFormasPgto.pIncluirFormasPagto(pId: Integer; pDescricao: string;
  pValor: Double);
begin
  with cdsFormaPgto do
  begin
    Open;
    Append;
    FieldByName('codformapagto').AsInteger := pId;
    FieldByName('descricao').AsString      := Trim(pDescricao);
    FieldByName('valor').AsFloat           := pValor;
    Post;
  end;
end;

procedure TfrmPesqFormasPgto.pSelecionaFormaPagto;
begin

  edtFormaPagtoCod.Text  := dmFormaPgto.fdqryFormaPgtoid.AsString;
  edtFormaPagtoDesc.Text := dmFormaPgto.fdqryFormaPgtodescricao.AsString;

  btnIncluirPagto.Enabled := True;

  if dmFormaPgto.fdqryFormaPgtoid.AsInteger = 1 then
  begin
    grpValorPago.Enabled    := True;
    edtValorPago.SetFocus;
  end
  else
  begin
    grpValorPago.Enabled    := False;
    btnIncluirPagto.SetFocus;
  end;

  pAddFieldscdsFormaPgto;
end;
end.
