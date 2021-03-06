unit UfrmPesqSabores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPesqSabores = class(TForm)
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
    procedure PesqTiposPizza;
  public
    { Public declarations }
  end;

var
  frmPesqSabores: TfrmPesqSabores;

implementation

{$R *.dfm}

uses uFuncoes, UfrmVendas, UdmSabores;

procedure TfrmPesqSabores.btnLimpaPesqClick(Sender: TObject);
begin
  edtPesquisar.Clear;
  pPesqLocate(dmSabores.fdqrySabores, edtPesquisar, 'descricao');
  edtPesquisar.SetFocus;
end;

procedure TfrmPesqSabores.dbgPesqRegistrosDblClick(Sender: TObject);
begin
  PesqTiposPizza;
end;

procedure TfrmPesqSabores.dbgPesqRegistrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    PesqTiposPizza;
  end;
end;

procedure TfrmPesqSabores.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  pPesqLocate(dmSabores.fdqrySabores, edtPesquisar, 'descricao');
end;

procedure TfrmPesqSabores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPesqSabores := nil;
end;

procedure TfrmPesqSabores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmSabores.fdqrySabores.Close;
end;

procedure TfrmPesqSabores.FormCreate(Sender: TObject);
begin
  if not Assigned(dmSabores) then
    dmSabores := TdmSabores.Create(Self);
  dmSabores.fdqrySabores.Open;
end;

procedure TfrmPesqSabores.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmSabores);
end;

procedure TfrmPesqSabores.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
    Close;
end;

procedure TfrmPesqSabores.PesqTiposPizza;
begin
  frmVendas.lstSaboresPedido.Items.Add(dmSabores.fdqrySaboresid.AsString + ^I + '-' + ^I + dmSabores.fdqrySaboresdescricao.AsString);

  ModalResult := mrOk;
end;

end.
