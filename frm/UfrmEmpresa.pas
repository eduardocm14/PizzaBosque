unit UfrmEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, UfrmPadrao;

type
  TfrmEmpresa = class(TfrmPadrao)
    pnlBtn: TPanel;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    Label1: TLabel;
    dbedtRazao: TDBEdit;
    lbl1: TLabel;
    dbedtFantasia: TDBEdit;
    Label2: TLabel;
    dbedtCnpj: TDBEdit;
    Label3: TLabel;
    dbedtInscEst: TDBEdit;
    Label4: TLabel;
    dbedtFone1: TDBEdit;
    Label5: TLabel;
    dbedtFone2: TDBEdit;
    procedure dbedtCnpjKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtInscEstKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtFone1KeyPress(Sender: TObject; var Key: Char);
    procedure dbedtFone2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

{$R *.dfm}

uses UdmEmpresa, uMensagens, uFuncoes, UfrmPrincipal;

procedure TfrmEmpresa.btnAlterarClick(Sender: TObject);
begin
  inherited;
  dmEmpresa.fdqEmpresa.Edit;
  pBtnCadastros(btnAlterar, btnNovo, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtRazao);

  if dmEmpresa.fdqEmpresa.IsEmpty then
    btnNovo.Enabled := True
  else
    btnNovo.Enabled := False;
end;

procedure TfrmEmpresa.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmEmpresa.fdqEmpresa.Cancel;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtRazao);

  if dmEmpresa.fdqEmpresa.IsEmpty then
    btnNovo.Enabled := True
  else
    btnNovo.Enabled := False;

end;

procedure TfrmEmpresa.btnNovoClick(Sender: TObject);
begin
  inherited;
  dmEmpresa.fdqEmpresa.Append;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtRazao);
end;

procedure TfrmEmpresa.btnSalvarClick(Sender: TObject);
begin
  inherited;
  dmEmpresa.fdqEmpresa.Post;
  if application.MessageBox (msg3, cMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
  begin
    pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
    pDbEditCadastro(Self, dbedtRazao);
  end;

  if dmEmpresa.fdqEmpresa.IsEmpty then
    btnNovo.Enabled := True
  else
    btnNovo.Enabled := False;
end;

procedure TfrmEmpresa.dbedtCnpjKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // Somente N�meros no dbEdit
  if not (CharInSet(Key,['0'..'9',#8])) then Key := #0;
end;

procedure TfrmEmpresa.dbedtInscEstKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // Somente N�meros no dbEdit
  if not (CharInSet(Key,['0'..'9',#8])) then Key := #0;
end;

procedure TfrmEmpresa.dbedtFone1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // Somente N�meros no dbEdit
  if not (CharInSet(Key,['0'..'9',#8])) then Key := #0;
end;

procedure TfrmEmpresa.dbedtFone2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // Somente N�meros no dbEdit
  if not (CharInSet(Key,['0'..'9',#8])) then Key := #0;
end;

procedure TfrmEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.Caption := Format(msg29,[fNomePizzaria, sGbUsuarioLogado]);
end;

procedure TfrmEmpresa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  dmEmpresa.fdqEmpresa.Close;
end;

procedure TfrmEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmEmpresa) then
    dmEmpresa := TdmEmpresa.Create(Self);
  dmEmpresa.fdqEmpresa.Open;
end;

procedure TfrmEmpresa.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmEmpresa);
end;

procedure TfrmEmpresa.FormShow(Sender: TObject);
begin
  inherited;
  if dmEmpresa.fdqEmpresa.IsEmpty then
    btnNovo.Enabled := True
  else
    btnNovo.Enabled := False;
end;

end.
