unit UfrmPesqEntregadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPesqEntregadores = class(TForm)
    dbgPesqRegistros: TDBGrid;
    grpPesquisar: TGroupBox;
    pnlPesquisar: TPanel;
    btnLimpaPesq: TButton;
    edtPesquisar: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPesqRegistrosDblClick(Sender: TObject);
    procedure dbgPesqRegistrosKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaPesqClick(Sender: TObject);
  private
    { Private declarations }
    procedure pPesqEntregadores;
  public
    { Public declarations }
  end;

var
  frmPesqEntregadores: TfrmPesqEntregadores;

implementation

{$R *.dfm}

uses uFuncoes, UfrmVendas, UdmEntregadores;

procedure TfrmPesqEntregadores.btnLimpaPesqClick(Sender: TObject);
begin
  edtPesquisar.Clear;
  pPesqLocate(dmEntregadores.fdqryEntregadores, edtPesquisar, 'descricao');
  edtPesquisar.SetFocus;
end;

procedure TfrmPesqEntregadores.dbgPesqRegistrosDblClick(Sender: TObject);
begin
  pPesqEntregadores;
end;

procedure TfrmPesqEntregadores.dbgPesqRegistrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    pPesqEntregadores;
  end;
end;

procedure TfrmPesqEntregadores.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  pPesqLocate(dmEntregadores.fdqryEntregadores, edtPesquisar, 'descricao');
end;

procedure TfrmPesqEntregadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPesqEntregadores := nil;
end;

procedure TfrmPesqEntregadores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmEntregadores.fdqryEntregadores.Close;
end;

procedure TfrmPesqEntregadores.FormCreate(Sender: TObject);
begin
  if not Assigned(dmEntregadores) then
    dmEntregadores := TdmEntregadores.Create(Self);
  dmEntregadores.fdqryEntregadores.Open;
end;

procedure TfrmPesqEntregadores.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmEntregadores);
end;

procedure TfrmPesqEntregadores.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
    Close;
end;

procedure TfrmPesqEntregadores.pPesqEntregadores;
begin
  if Assigned(frmVendas) then
    frmVendas.stbVendas.Panels[4].Text := 'Entregador: ' + dmEntregadores.fdqryEntregadoresdescricao.AsString;

  sGbCodEntregador := dmEntregadores.fdqryEntregadoresid.AsString;

  ModalResult := mrOk;
end;

end.
