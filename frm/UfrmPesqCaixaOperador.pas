unit UfrmPesqCaixaOperador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPesqCaixaOperador = class(TForm)
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
    procedure PesqCaixasOperadores;
  public
    { Public declarations }
  end;

var
  frmPesqCaixaOperador: TfrmPesqCaixaOperador;

implementation

{$R *.dfm}

uses uFuncoes, UdmUsuarios;

procedure TfrmPesqCaixaOperador.btnLimpaPesqClick(Sender: TObject);
begin
  edtPesquisar.Clear;
  pPesqLocate(dmUsuarios.fdqPesqCaixaOperador, edtPesquisar, 'descricao');
  edtPesquisar.SetFocus;
end;

procedure TfrmPesqCaixaOperador.dbgPesqRegistrosDblClick(Sender: TObject);
begin
  PesqCaixasOperadores;
end;

procedure TfrmPesqCaixaOperador.dbgPesqRegistrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    PesqCaixasOperadores;
  end;
end;

procedure TfrmPesqCaixaOperador.edtPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  pPesqLocate(dmUsuarios.fdqPesqCaixaOperador, edtPesquisar, 'descricao');
end;

procedure TfrmPesqCaixaOperador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action               := caFree;
  frmPesqCaixaOperador := nil;
end;

procedure TfrmPesqCaixaOperador.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmUsuarios.fdqPesqCaixaOperador.Close;
end;

procedure TfrmPesqCaixaOperador.FormCreate(Sender: TObject);
begin
  if not Assigned(dmUsuarios.fdqPesqCaixaOperador) then
    dmUsuarios := TdmUsuarios.Create(Self);
  dmUsuarios.fdqPesqCaixaOperador.Open;
end;

procedure TfrmPesqCaixaOperador.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmUsuarios);
end;

procedure TfrmPesqCaixaOperador.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #27 then
    Close;
end;

procedure TfrmPesqCaixaOperador.PesqCaixasOperadores;
begin
  //frmVendas.lstSaboresPedido.Items.Add(dmSabores.fdqrySaboresid.AsString + ^I + '-' + ^I + dmSabores.fdqrySaboresdescricao.AsString);

  ModalResult := mrOk;
end;

end.
