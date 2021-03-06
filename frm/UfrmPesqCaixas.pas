unit UfrmPesqCaixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPesqCaixas = class(TForm)
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
    procedure PesqCaixas;
  public
    { Public declarations }
  end;

var
  frmPesqCaixas: TfrmPesqCaixas;

implementation

{$R *.dfm}

uses uFuncoes, UfrmVendas, UdmCaixas, UfrmAbreCaixas;

procedure TfrmPesqCaixas.btnLimpaPesqClick(Sender: TObject);
begin
  edtPesquisar.Clear;
  pPesqLocate(dmCaixas.fdqCaixasPesq, edtPesquisar, 'descricao');
  edtPesquisar.SetFocus;
end;

procedure TfrmPesqCaixas.dbgPesqRegistrosDblClick(Sender: TObject);
begin
  PesqCaixas;
end;

procedure TfrmPesqCaixas.dbgPesqRegistrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    PesqCaixas;
  end;
end;

procedure TfrmPesqCaixas.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  pPesqLocate(dmCaixas.fdqCaixasPesq, edtPesquisar, 'descricao');
end;

procedure TfrmPesqCaixas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action        := caFree;
  frmPesqCaixas := nil;
end;

procedure TfrmPesqCaixas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmCaixas.fdqCaixasPesq.Close;
end;

procedure TfrmPesqCaixas.FormCreate(Sender: TObject);
begin
  if not Assigned(dmCaixas) then
    dmCaixas := TdmCaixas.Create(Self);
  dmCaixas.fdqCaixasPesq.Open;
end;

procedure TfrmPesqCaixas.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmCaixas);
end;

procedure TfrmPesqCaixas.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
    Close;
end;

procedure TfrmPesqCaixas.PesqCaixas;
begin
  frmAbreCaixas.edtCodCaixa.Text  := dmCaixas.fdqCaixasPesqid.AsString;
  frmAbreCaixas.edtDescCaixa.Text := dmCaixas.fdqCaixasPesqdescricao.AsString;
  ModalResult := mrOk;
end;

end.
