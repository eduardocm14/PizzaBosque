unit UfrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Menus, UfrmPadrao;

type
  TfrmClientes = class(TfrmPadrao)
    dbgrdClientes: TDBGrid;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    lbl1: TLabel;
    dbedtNome: TDBEdit;
    lbl2: TLabel;
    dbedtFone: TDBEdit;
    lbl3: TLabel;
    dbedtCel: TDBEdit;
    lbl4: TLabel;
    dbedtCidade: TDBEdit;
    lbl5: TLabel;
    dbedtBairro: TDBEdit;
    lbl6: TLabel;
    dbedtRua: TDBEdit;
    lbl7: TLabel;
    dbedtCep: TDBEdit;
    pmExcluir: TPopupMenu;
    Exluir1: TMenuItem;
    dbedtNum: TDBEdit;
    lbl8: TLabel;
    dbedtComplemento: TDBEdit;
    lbl9: TLabel;
    btnCep: TBitBtn;
    edtPesquisar: TEdit;
    pnlPesquisar: TPanel;
    rgOpcao: TRadioGroup;
    pnlBtn: TPanel;
    dbrgAtivo: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure Exluir1Click(Sender: TObject);
    procedure btnCepClick(Sender: TObject);
    procedure dbedtCepKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtCepExit(Sender: TObject);
    procedure dbedtCelKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtFoneKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure rgOpcaoClick(Sender: TObject);
    procedure dbgrdClientesDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses UdmClientes, uFuncoes, uMensagens, ConsultaCEP;

procedure TfrmClientes.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if not dmClientes.fdqryClientes.IsEmpty then
  begin
    dmClientes.fdqryClientes.Edit;
    pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
    pDbEditCadastro(Self, dbedtNome);
    dbrgAtivo.Enabled := True;
    rgOpcao.Enabled := False;

    if fConexaoInternet then
      btnCep.Enabled := True
    else
      btnCep.Enabled := False;

    dbgrdClientes.Enabled := False;
    dbgrdClientes.Refresh;
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

procedure TfrmClientes.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmClientes.fdqryClientes.Cancel;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbrgAtivo.Enabled := False;
  rgOpcao.Enabled := True;
  btnCep.Enabled := False;
  dbgrdClientes.Enabled := True;
  dbgrdClientes.Refresh;
end;

procedure TfrmClientes.btnCepClick(Sender: TObject);
var
  ws: AtendeCliente;
  Endereco: TEndereco;
begin
  inherited;

  if not (Trim(dbedtCep.Text).IsEmpty) then
  begin
     ws := GetAtendeCliente();

     try
        Endereco := ws.consultaCEP(dbedtCep.Text);
        dbedtCidade.Text := Endereco.cidade;
        dbedtBairro.Text := Endereco.bairro;
        dbedtRua.Text := Endereco.logradouro;
        dbedtComplemento.Font.Color := clWindowText;
        dbedtComplemento.Font.Style := [];
        dbedtComplemento.Text := Endereco.complemento + '/' + Endereco.complemento2;
        dbedtNum.SetFocus;
     except
       on e: SigepClienteException do
       begin
         dbedtCidade.Clear;
         dbedtBairro.Clear;
         dbedtRua.Clear;
         dbedtNum.Clear;
         dbedtComplemento.Font.Color := clRed;
         dbedtComplemento.Font.Style := [fsBold];
         dbedtComplemento.Text := (E.Value);
         dbedtCep.SetFocus;
       end;
     end;
  end
  else
  begin
    if application.MessageBox (msg6, aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
      dbedtCep.SetFocus;
  end;
end;

procedure TfrmClientes.btnNovoClick(Sender: TObject);
begin
  inherited;
  dmClientes.fdqryClientes.Append;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  rgOpcao.Enabled := False;
  btnCep.Enabled := True;
  dbgrdClientes.Enabled := False;
  dbgrdClientes.Refresh;
end;

procedure TfrmClientes.btnSalvarClick(Sender: TObject);
begin
  inherited;
  dmClientes.fdqryClientes.Post;
  dmClientes.fdqryClientes.Refresh;
  if application.MessageBox (msg3, cMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbrgAtivo.Enabled := False;
  rgOpcao.Enabled := True;
  btnCep.Enabled := False;
  dbgrdClientes.Enabled := True;
  dbgrdClientes.Refresh;
end;

procedure TfrmClientes.dbedtCelKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // Somente N�meros no dbEdit
  if not (CharInSet(Key,['0'..'9',#8])) then Key := #0;
end;

procedure TfrmClientes.dbedtCepExit(Sender: TObject);
begin
  inherited;

  if not(Trim(dbedtCep.Text).IsEmpty) and (Length(Trim(dbedtCep.Text)) < 8) then
    begin
      if application.MessageBox (msg7, aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
      dbedtCep.SetFocus;
      Exit;
    end;
end;

procedure TfrmClientes.dbedtCepKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  // Somente N�meros no dbEdit
  if not (CharInSet(Key,['0'..'9',#8])) then Key := #0;
end;

procedure TfrmClientes.dbedtFoneKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // Somente N�meros no dbEdit
  if not (CharInSet(Key,['0'..'9',#8])) then Key := #0;
end;

procedure TfrmClientes.dbgrdClientesDblClick(Sender: TObject);
begin
  inherited;
  if btnAlterar.CanFocus then
    btnAlterarClick(Self);
end;

procedure TfrmClientes.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  with dmClientes do
  begin
    case rgOpcao.ItemIndex of
      0 : begin
           edtPesquisar.NumbersOnly := False;
           pPesqLocate(fdqryClientes,edtPesquisar, 'nome');
          end;

      1 : begin
           edtPesquisar.NumbersOnly := True;
           pPesqLocate(fdqryClientes,edtPesquisar, 'fone');
          end;

      2 : begin
           edtPesquisar.NumbersOnly := True;
           pPesqLocate(fdqryClientes,edtPesquisar, 'cel');
          end;
    end;
  end;

end;

procedure TfrmClientes.Exluir1Click(Sender: TObject);
begin
  inherited;

  if application.MessageBox(Pchar(msg4 + dmClientes.fdqryClientesnome.AsString), cMsg, MB_YESNO + MB_ICONINFORMATION) = IDYES then
    begin
      dmClientes.fdqryClientes.Delete;
      dmClientes.fdqryClientes.Refresh;
    end;
end;

procedure TfrmClientes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  dmClientes.fdqryClientes.Close;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmClientes) then
    dmClientes := TdmClientes.Create(Self);
  dmClientes.fdqryClientes.Open;
end;

procedure TfrmClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmClientes);
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  inherited;

  if fConexaoInternet then
    btnCep.Enabled := True
  else
    btnCep.Enabled := False;
end;

procedure TfrmClientes.rgOpcaoClick(Sender: TObject);
begin
  inherited;
  edtPesquisar.Clear;
  pPesqLocate(dmClientes.fdqryClientes,edtPesquisar, '');
  edtPesquisar.SetFocus;
end;

end.
