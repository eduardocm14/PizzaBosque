unit UfrmPesqTipoPizza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPesqTipoPizza = class(TForm)
    edtPesquisar: TEdit;
    pnlPesquisar: TPanel;
    dbgPesqDepartamentos: TDBGrid;
    grpPesquisar: TGroupBox;
    btnLimpaPesq: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPesqDepartamentosDblClick(Sender: TObject);
    procedure dbgPesqDepartamentosKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaPesqClick(Sender: TObject);
  private
    { Private declarations }
    procedure PesqTiposPizza;
  public
    { Public declarations }
  end;

var
  frmPesqTipoPizza: TfrmPesqTipoPizza;

implementation

{$R *.dfm}

uses uFuncoes, UfrmVendas, UdmProdutos;

procedure TfrmPesqTipoPizza.btnLimpaPesqClick(Sender: TObject);
begin
  edtPesquisar.Clear;
  pPesqLocate(dmProdutos.fdqryProdutos, edtPesquisar, 'descricao');
  edtPesquisar.SetFocus;
end;

procedure TfrmPesqTipoPizza.dbgPesqDepartamentosDblClick(Sender: TObject);
begin
  PesqTiposPizza;
end;

procedure TfrmPesqTipoPizza.dbgPesqDepartamentosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    PesqTiposPizza;
  end;
end;

procedure TfrmPesqTipoPizza.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  pPesqLocate(dmProdutos.fdqryProdutos, edtPesquisar, 'descricao');
end;

procedure TfrmPesqTipoPizza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPesqTipoPizza := nil;
end;

procedure TfrmPesqTipoPizza.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmProdutos.fdqryProdutos.Close;
end;

procedure TfrmPesqTipoPizza.FormCreate(Sender: TObject);
begin
  if not Assigned(dmProdutos) then
    dmProdutos := TdmProdutos.Create(Self);
  dmProdutos.fdqryProdutos.Open;
end;

procedure TfrmPesqTipoPizza.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmProdutos);
end;

procedure TfrmPesqTipoPizza.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
    Close;
end;

procedure TfrmPesqTipoPizza.PesqTiposPizza;
begin
  frmVendas.edtProdutoCod.Text            := dmProdutos.fdqryProdutosid.AsString;
  frmVendas.edtProdutoDesc.Text           := dmProdutos.fdqryProdutosdescricao.AsString;
  frmVendas.edtProdutoTamanho.Text        := dmProdutos.fdqryProdutoscm.AsString;
  frmVendas.edtProdutoFatias.Text         := dmProdutos.fdqryProdutosfatias.AsString;
  sGbTipoProd                             := dmProdutos.fdqryProdutostipo.AsString;
  frmVendas.edtProdutoValor.Text          := FormatFloat('#####0.00',StrToFloat(dmProdutos.fdqryProdutosvalor.AsString));

  frmVendas.btnIncluirProdutoPedido.Enabled := True;
  frmVendas.grpPedidoVenda.Enabled          := True;

  if dmProdutos.fdqryProdutostipo.AsString = 'P' then
  begin
    frmVendas.edtPesqCodSabores.Enabled     := True;
    frmVendas.edtPesqCodSabores.SetFocus;
    frmVendas.btnIncluirSabor.Enabled       := True;
    frmVendas.btnRetirarSabor.Enabled       := True;
  end
  else
  begin
    frmVendas.edtPesqCodSabores.Enabled := False;
    frmVendas.btnIncluirSabor.Enabled   := False;
    frmVendas.btnRetirarSabor.Enabled   := False;
    frmVendas.btnIncluirProdutoPedido.SetFocus;
  end;

  ModalResult := mrOk;
end;

end.
