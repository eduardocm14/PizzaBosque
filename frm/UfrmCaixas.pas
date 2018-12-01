unit UfrmCaixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, UfrmPadrao,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Access2000;

type
  TfrmCaixas = class(TfrmPadrao)
    pnlCadastros: TPanel;
    lbl1: TLabel;
    dbedtNome: TDBEdit;
    dbgCaixas: TDBGrid;
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
    procedure dbgCaixasDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCaixas: TfrmCaixas;

implementation

{$R *.dfm}

uses uFuncoes, uMensagens, UdmCaixas;

procedure TfrmCaixas.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dmCaixas.fdqCaixas.IsEmpty then
  begin
    dmCaixas.fdqCaixas.Edit;
    pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
    pDbEditCadastro(Self, dbedtNome);
    dbgCaixas.Enabled := False;
    dbgCaixas.Refresh;
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

procedure TfrmCaixas.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmCaixas.fdqCaixas.Cancel;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbgCaixas.Enabled := True;
  dbgCaixas.Refresh;
end;

procedure TfrmCaixas.btnNovoClick(Sender: TObject);
begin
  inherited;
  dmCaixas.fdqCaixas.Append;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbgCaixas.Enabled := False;
  dbgCaixas.Refresh;
end;

procedure TfrmCaixas.btnSalvarClick(Sender: TObject);
begin
  inherited;
  dmCaixas.fdqCaixas.Post;
  dmCaixas.fdqCaixas.Refresh;
  if application.MessageBox (msg3, cMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbgCaixas.Enabled := True;
  dbgCaixas.Refresh;
end;

procedure TfrmCaixas.dbgCaixasDblClick(Sender: TObject);
begin
  inherited;
  if btnAlterar.CanFocus then
    btnAlterar.Click;
end;

procedure TfrmCaixas.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  pPesqLocate(dmCaixas.fdqCaixas, edtPesquisar, 'descricao');
end;

procedure TfrmCaixas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action    := caFree;
  frmCaixas := nil;
end;

procedure TfrmCaixas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  dmCaixas.fdqCaixas.Close;
end;

procedure TfrmCaixas.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmCaixas) then
    dmCaixas := TdmCaixas.Create(Self);
  dmCaixas.fdqCaixas.Open;
end;

procedure TfrmCaixas.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmCaixas);
end;

end.

