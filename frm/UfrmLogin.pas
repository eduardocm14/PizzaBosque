unit UfrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActiveX, Vcl.ExtCtrls,
  Data.DB, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    btnLogin: TButton;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnSair: TButton;
    Shape1: TShape;
    imgLogin: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure LogarUsuario(usuario:string; senha:string);
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses UdmUsuarios, uFuncoes, uMensagens;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  LogarUsuario(edtUsuario.Text, edtSenha.Text);
end;

procedure TfrmLogin.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  sGbVersao := '[Vers�o: ' + fVersaoExe + '] - [' + FormatDateTime('dd/mm/yyyy', Now) + ' - ' + FormatDateTime('hh:mm', Now) + ']';
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Close;
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  Self.Caption := sGbVersao;
end;

procedure TfrmLogin.LogarUsuario(usuario, senha: string);
begin
  if not (Trim(usuario).IsEmpty) and  not(Trim(senha).IsEmpty) then
  begin
    try
      if not Assigned(dmUsuarios) then
        dmUsuarios := TdmUsuarios.Create(Self);

        with dmUsuarios.fdqryLogin do
          begin
            Close;
            SQL.Add( ' SELECT ID, NOME, USUARIO, SENHA FROM USUARIOS' +
                     ' WHERE USUARIO = ' + QuotedStr(AnsiLowerCase(usuario)) +
                     ' AND SENHA = ' + QuotedStr(AnsiLowerCase(senha)));

            Open;

            if not IsEmpty then
            begin
              ModalResult      := mrOk;
              sGbUsuarioLogado := FieldByName('NOME').AsString;
              iGbCodUsuario    := FieldByName('ID').AsInteger;
            end
            else
            begin
              if application.MessageBox (msg10,aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
                edtUsuario.SetFocus;
            end;
          end;

    finally
      FreeAndNil(dmUsuarios);
    end;
  end
  else
  begin
    if application.MessageBox (msg9, eMsg, MB_OK + MB_ICONERROR) = IDOK then
      edtUsuario.SetFocus;
  end;
end;

end.
