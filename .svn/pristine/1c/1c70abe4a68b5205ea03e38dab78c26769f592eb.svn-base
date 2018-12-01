unit UfrmSabores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, UfrmPadrao,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TfrmSabores = class(TfrmPadrao)
    pnlCadastros: TPanel;
    lbl1: TLabel;
    dbedtNome: TDBEdit;
    dbgRegistros: TDBGrid;
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
    dbrgEspecial: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure dbgRegistrosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSabores: TfrmSabores;

implementation

{$R *.dfm}

uses uFuncoes, uMensagens, UdmSabores;

procedure TfrmSabores.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dmSabores.fdqrySabores.IsEmpty then
  begin
    dmSabores.fdqrySabores.Edit;
    pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
    dbrgEspecial.Enabled := True;
    pDbEditCadastro(Self, dbedtNome);
    dbgRegistros.Enabled := False;
    dbgRegistros.Refresh;
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

procedure TfrmSabores.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmSabores.fdqrySabores.Cancel;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  dbrgEspecial.Enabled := False;
  pDbEditCadastro(Self, dbedtNome);
  dbgRegistros.Enabled := True;
  dbgRegistros.Refresh;
end;

procedure TfrmSabores.btnNovoClick(Sender: TObject);
begin
  inherited;
  dmSabores.fdqrySabores.Append;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  dbrgEspecial.Enabled := True;
  pDbEditCadastro(Self, dbedtNome);
  dbgRegistros.Enabled := False;
  dbgRegistros.Refresh;
end;

procedure TfrmSabores.btnSalvarClick(Sender: TObject);
begin
  inherited;
  dmSabores.fdqrySabores.Post;
  dmSabores.fdqrySabores.Refresh;
  if application.MessageBox (msg3, cMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbrgEspecial.Enabled := False;
  dbgRegistros.Enabled := True;
  dbgRegistros.Refresh;
end;

procedure TfrmSabores.dbgRegistrosDblClick(Sender: TObject);
begin
  inherited;
  if btnAlterar.CanFocus then
    btnAlterar.Click;
end;

procedure TfrmSabores.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  pPesqLocate(dmSabores.fdqrySabores, edtPesquisar, 'descricao');
end;

procedure TfrmSabores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  dmSabores.fdqrySabores.Close;
end;

procedure TfrmSabores.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmSabores) then
    dmSabores := TdmSabores.Create(Self);
  dmSabores.fdqrySabores.Open;
end;

procedure TfrmSabores.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmSabores);
end;

end.
