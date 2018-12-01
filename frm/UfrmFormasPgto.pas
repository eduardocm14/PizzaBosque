unit UfrmFormasPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, UfrmPadrao,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TfrmFormasPagto = class(TfrmPadrao)
    pnlCadastros: TPanel;
    lbl1: TLabel;
    dbedtNome: TDBEdit;
    dbgrdFormaPgto: TDBGrid;
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
    procedure dbgrdFormaPgtoDblClick(Sender: TObject);
    procedure Exluir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormasPagto: TfrmFormasPagto;

implementation

{$R *.dfm}

uses UdmFormaPgto, uFuncoes, uMensagens;

procedure TfrmFormasPagto.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dmFormaPgto.fdqryFormaPgto.IsEmpty then
  begin
    dmFormaPgto.fdqryFormaPgto.Edit;
    pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
    pDbEditCadastro(Self, dbedtNome);
    dbgrdFormaPgto.Enabled := False;
    dbgrdFormaPgto.Refresh;
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

procedure TfrmFormasPagto.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmFormaPgto.fdqryFormaPgto.Cancel;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbgrdFormaPgto.Enabled := True;
  dbgrdFormaPgto.Refresh;
end;

procedure TfrmFormasPagto.btnNovoClick(Sender: TObject);
begin
  inherited;
  dmFormaPgto.fdqryFormaPgto.Append;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbgrdFormaPgto.Enabled := False;
  dbgrdFormaPgto.Refresh;
end;

procedure TfrmFormasPagto.btnSalvarClick(Sender: TObject);
begin
  inherited;
  dmFormaPgto.fdqryFormaPgto.Post;
  dmFormaPgto.fdqryFormaPgto.Refresh;
  if application.MessageBox (msg3, cMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbgrdFormaPgto.Enabled := True;
  dbgrdFormaPgto.Refresh;
end;

procedure TfrmFormasPagto.dbgrdFormaPgtoDblClick(Sender: TObject);
begin
  inherited;
  if btnAlterar.CanFocus then
    btnAlterar.Click;
end;

procedure TfrmFormasPagto.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  pPesqLocate(dmFormaPgto.fdqryFormaPgto, edtPesquisar, 'descricao');
end;

procedure TfrmFormasPagto.Exluir1Click(Sender: TObject);
begin
  inherited;
  if dmFormaPgto.fdqryFormaPgtoid.AsInteger > 1 then
  begin
    if application.MessageBox(Pchar(msg4 + dmFormaPgto.fdqryFormaPgtodescricao.AsString), cMsg, MB_YESNO + MB_ICONINFORMATION) = IDYES then
    begin
      dmFormaPgto.fdqryFormaPgto.Delete;
      dmFormaPgto.fdqryFormaPgto.Refresh;
    end;
  end
  else
  begin
    if Application.MessageBox('Dinheiro � padr�o do sistema e n�o pode ser exclu�do!', aMsg, MB_OK + MB_ICONWARNING)= IDOK then
  end;
end;

procedure TfrmFormasPagto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  dmFormaPgto.fdqryFormaPgto.Close;
end;

procedure TfrmFormasPagto.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmFormaPgto) then
    dmFormaPgto := TdmFormaPgto.Create(Self);
  dmFormaPgto.fdqryFormaPgto.Open;
end;

procedure TfrmFormasPagto.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmFormaPgto);
end;

end.
