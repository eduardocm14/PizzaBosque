unit UfrmPesqClientesVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, UfrmPadrao,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Menus;

type
  TfrmPesqClientesVendas = class(TfrmPadrao)
    pnlPesquisar: TPanel;
    edtPesquisar: TEdit;
    dbgrdClientes: TDBGrid;
    btnLimpar: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnLimparClick(Sender: TObject);
    procedure DadosCliente;
    procedure dbgrdClientesDblClick(Sender: TObject);
    procedure btnIncluirAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdClientesKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqClientesVendas: TfrmPesqClientesVendas;

implementation

{$R *.dfm}

uses UdmPesqClientesVenda, uFuncoes, UfrmVendas, UfrmClientes;

procedure TfrmPesqClientesVendas.btnIncluirAlterarClick(Sender: TObject);
begin
  inherited;
  try
    pCriarForm(TfrmClientes, frmClientes);
  finally
    btnLimparClick(Self);
  end;
end;

procedure TfrmPesqClientesVendas.btnLimparClick(Sender: TObject);
begin
  inherited;
  edtPesquisar.Clear;
  pPesqLocate(dmPesqClientesVenda.fdqryPesqClientesVendas, edtPesquisar, 'nome');
  edtPesquisar.SetFocus;
end;

procedure TfrmPesqClientesVendas.dbgrdClientesDblClick(Sender: TObject);
begin
  inherited;
  DadosCliente;
end;

procedure TfrmPesqClientesVendas.dbgrdClientesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    DadosCliente;

end;

procedure TfrmPesqClientesVendas.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  pPesqLocate(dmPesqClientesVenda.fdqryPesqClientesVendas, edtPesquisar, 'nome');
end;

procedure TfrmPesqClientesVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmPesqClientesVendas := nil;
end;

procedure TfrmPesqClientesVendas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  dmPesqClientesVenda.fdqryPesqClientesVendas.Close;
end;

procedure TfrmPesqClientesVendas.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmPesqClientesVenda) then
    dmPesqClientesVenda := TdmPesqClientesVenda.Create(Self);
  dmPesqClientesVenda.fdqryPesqClientesVendas.Open;
end;

procedure TfrmPesqClientesVendas.DadosCliente;
begin

  frmVendas.edtPesqFone.Clear;

  if dmPesqClientesVenda.fdqryPesqClientesFone.Active then
    frmVendas.fPesqClienteFone('fone off');

  if not Trim(dmPesqClientesVenda.fdqryPesqClientesVendasfone.AsString).IsEmpty then
    frmVendas.edtPesqFone.Text := dmPesqClientesVenda.fdqryPesqClientesVendasfone.AsString
  else
    frmVendas.edtPesqFone.Text := dmPesqClientesVenda.fdqryPesqClientesVendascel.AsString;

  if frmVendas.edtPesqFone.CanFocus then
    frmVendas.edtPesqFone.SetFocus;

  ModalResult := mrOk;
end;

end.
