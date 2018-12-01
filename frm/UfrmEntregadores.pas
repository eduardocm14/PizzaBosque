unit UfrmEntregadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, UfrmPadrao,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Access2000;

type
  TfrmEntregadores = class(TfrmPadrao)
    pnlCadastros: TPanel;
    lbl1: TLabel;
    dbedtNome: TDBEdit;
    dbgEntregadores: TDBGrid;
    pnlBtn: TPanel;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    pnlPesquisar: TPanel;
    lblPesq: TLabel;
    edtPesquisar: TEdit;
    pmExcluir: TPopupMenu;
    Exluir1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure dbgEntregadoresDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntregadores: TfrmEntregadores;

implementation

{$R *.dfm}

uses uFuncoes, uMensagens, UdmEntregadores;

procedure TfrmEntregadores.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dmEntregadores.fdqryEntregadores.IsEmpty then
  begin
    dmEntregadores.fdqryEntregadores.Edit;
    pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
    pDbEditCadastro(Self, dbedtNome);
    dbgEntregadores.Enabled := False;
    dbgEntregadores.Refresh;
  end
  else
  begin
    if application.MessageBox (msg12, aMsg, MB_OK + MB_ICONWARNING) = IDOK then
    begin
      edtPesquisar.Clear;
      if btnNovo.CanFocus then
        btnNovo.SetFocus;
    end;
  end;
end;

procedure TfrmEntregadores.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmEntregadores.fdqryEntregadores.Cancel;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbgEntregadores.Enabled := True;
  dbgEntregadores.Refresh;
end;

procedure TfrmEntregadores.btnNovoClick(Sender: TObject);
begin
  inherited;
  dmEntregadores.fdqryEntregadores.Append;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbgEntregadores.Enabled := False;
  dbgEntregadores.Refresh;
end;

procedure TfrmEntregadores.btnSalvarClick(Sender: TObject);
begin
  inherited;
  dmEntregadores.fdqryEntregadores.Post;
  dmEntregadores.fdqryEntregadores.Refresh;
  if application.MessageBox (msg3, cMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbgEntregadores.Enabled := True;
  dbgEntregadores.Refresh;
end;

procedure TfrmEntregadores.dbgEntregadoresDblClick(Sender: TObject);
begin
  inherited;
  if btnAlterar.CanFocus then
    btnAlterar.Click;
end;

procedure TfrmEntregadores.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  pPesqLocate(dmEntregadores.fdqryEntregadores, edtPesquisar, 'descricao');
end;

procedure TfrmEntregadores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  dmEntregadores.fdqryEntregadores.Close;
end;

procedure TfrmEntregadores.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmEntregadores) then
    dmEntregadores := TdmEntregadores.Create(Self);
    dmEntregadores.fdqryEntregadores.Open;
end;

procedure TfrmEntregadores.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmEntregadores);
end;

end.
