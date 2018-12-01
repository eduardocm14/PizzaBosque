unit UfrmIncluirAlterarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, UfrmPadrao,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmIncluirAlterarClientes = class(TfrmPadrao)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    dbedtNome: TDBEdit;
    dbedtFone: TDBEdit;
    dbedtCel: TDBEdit;
    dbedtCidade: TDBEdit;
    dbedtBairro: TDBEdit;
    dbedtRua: TDBEdit;
    dbedtCep: TDBEdit;
    dbedtNum: TDBEdit;
    dbedtComplemento: TDBEdit;
    edtComplemento2: TEdit;
    btnCep: TBitBtn;
    btnSalvar: TButton;
    btnLimpar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnCepClick(Sender: TObject);
    procedure dbedtFoneKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtCelKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtCepKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    procedure SqlAlteracaoCliente;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncluirAlterarClientes: TfrmIncluirAlterarClientes;

implementation

{$R *.dfm}

uses UfrmPesqClientesVenda, UdmPesqClientesVenda, uFuncoes, uMensagens,
  Data.DB, ConsultaCEP;

procedure TfrmIncluirAlterarClientes.btnLimparClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;

  if application.MessageBox (msg13, aMsg, MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    for i := 0 to Pred(ComponentCount) do
    begin
      if Components[i] is TDBEdit then
        TDBEdit(Components[i]).Clear;

      if Components[i] is TEdit then
        TEdit(Components[i]).Clear;
    end;
  end;

  dbedtNome.SetFocus;
end;

procedure TfrmIncluirAlterarClientes.btnCepClick(Sender: TObject);
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
        dbedtComplemento.Text := Endereco.complemento + '/' + Endereco.complemento2;
     except
       on e: SigepClienteException do
       begin
         dbedtCidade.Clear;
         dbedtBairro.Clear;
         dbedtRua.Clear;
         dbedtNum.Clear;
         dbedtComplemento.Text := (E.Value);
       end;
     end;
  end
  else
  begin
    if application.MessageBox (msg6, aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
      dbedtCep.SetFocus;
  end;
end;

procedure TfrmIncluirAlterarClientes.btnSalvarClick(Sender: TObject);
begin
  inherited;

  if application.MessageBox(msg3, cMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
  begin
    dmPesqClientesVenda.fdqryIncluirAlterarClientes.Post;
    dmPesqClientesVenda.fdqryIncluirAlterarClientes.Refresh;
    dmPesqClientesVenda.fdqryPesqClientesVendas.Refresh;
    frmPesqClientesVendas.btnLimparClick(Self);
    Close;
  end;
end;

procedure TfrmIncluirAlterarClientes.dbedtCelKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(Key,['0'..'9',#8])) then Key := #0;
end;

procedure TfrmIncluirAlterarClientes.dbedtCepKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(Key,['0'..'9',#8])) then Key := #0;
end;

procedure TfrmIncluirAlterarClientes.dbedtFoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (CharInSet(Key,['0'..'9',#8])) then Key := #0;
end;

procedure TfrmIncluirAlterarClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  frmPesqClientesVendas.oper := 0;
  Action := caFree;
  frmIncluirAlterarClientes := nil;
end;

procedure TfrmIncluirAlterarClientes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;

  dmPesqClientesVenda.fdqryIncluirAlterarClientes.Close;
end;

procedure TfrmIncluirAlterarClientes.FormCreate(Sender: TObject);
begin
  inherited;

  dmPesqClientesVenda.fdqryIncluirAlterarClientes.Open;
end;

procedure TfrmIncluirAlterarClientes.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if Key = #27 then
  begin
    if (dmPesqClientesVenda.fdqryIncluirAlterarClientes.State in [dsInsert,dsEdit]) then
    begin
      if application.MessageBox (msg14, aMsg, MB_YESNO + MB_ICONWARNING) = IDYES then
      begin
        Close;
      end
      else
      begin
        Abort;
      end;

    end;
  end;
end;

procedure TfrmIncluirAlterarClientes.FormShow(Sender: TObject);
begin
  inherited;

  if fConexaoInternet then
    btnCep.Enabled := True
  else
    btnCep.Enabled := False;

  if frmPesqClientesVendas.oper = 1 then
  begin
    Self.Caption := 'Cadastro de Cliente(Alterar)';
    SqlAlteracaoCliente;
  end;

  if frmPesqClientesVendas.oper = 2 then
  begin
    Self.Caption := 'Cadastro de Cliente(Incluir/Novo)';
    dmPesqClientesVenda.fdqryIncluirAlterarClientes.Append;
  end;
end;

procedure TfrmIncluirAlterarClientes.SqlAlteracaoCliente;
var
  codCliente : Integer;
begin
  codCliente := dmPesqClientesVenda.fdqryPesqClientesVendasid.AsInteger;

  with dmPesqClientesVenda.fdqryIncluirAlterarClientes do
  begin
    Close;
    SQL.Clear;
    SQL.Add( 'SELECT * FROM CLIENTES WHERE ID = ' + QuotedStr(IntToStr(codCliente)));
    Open;
    Edit;
  end;

end;

end.
