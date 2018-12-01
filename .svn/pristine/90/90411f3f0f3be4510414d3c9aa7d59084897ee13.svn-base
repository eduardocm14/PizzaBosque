unit UfrmAbreCaixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.ComCtrls, Vcl.Mask, UfrmPadrao,
  Vcl.DBCtrls, System.ImageList, Vcl.ImgList, StrUtils;

type
  TfrmAbreCaixas = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    btnCancelar: TButton;
    btnAbrirCaixa: TButton;
    gbxValorInicial: TGroupBox;
    edtValor: TEdit;
    btnSete: TBitBtn;
    btnOito: TBitBtn;
    btnNove: TBitBtn;
    btnQuatro: TBitBtn;
    btnCinco: TBitBtn;
    btnSeis: TBitBtn;
    btnTres: TBitBtn;
    btnDois: TBitBtn;
    btnUm: TBitBtn;
    btnLimpar: TBitBtn;
    btnZero: TBitBtn;
    btnVirgula: TBitBtn;
    gbxDataHora: TGroupBox;
    edtData: TEdit;
    gbxUsuario: TGroupBox;
    edtUsuario: TEdit;
    gbxCaixa: TGroupBox;
    edtDescCaixa: TEdit;
    edtCodCaixa: TEdit;
    btnPesqCaixas: TBitBtn;
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure btnNoveClick(Sender: TObject);
    procedure btnOitoClick(Sender: TObject);
    procedure btnSeteClick(Sender: TObject);
    procedure btnSeisClick(Sender: TObject);
    procedure btnCincoClick(Sender: TObject);
    procedure btnQuatroClick(Sender: TObject);
    procedure btnTresClick(Sender: TObject);
    procedure btnDoisClick(Sender: TObject);
    procedure btnUmClick(Sender: TObject);
    procedure btnVirgulaClick(Sender: TObject);
    procedure btnZeroClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnPesqCaixasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnAbrirCaixaClick(Sender: TObject);
    procedure edtCodCaixaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodCaixaExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbreCaixas: TfrmAbreCaixas;

implementation

{$R *.dfm}

uses uFuncoes, UfrmPesqCaixas, uMensagens;

procedure TfrmAbreCaixas.btnAbrirCaixaClick(Sender: TObject);
begin
  inherited;

  if Trim(edtCodCaixa.Text).IsEmpty then
  begin
    if application.MessageBox(Pchar(msg19 + 'Caixa'), aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
      edtCodCaixa.SetFocus;
    Abort;
  end;

  if Trim(edtValor.Text).IsEmpty then
  begin
    if application.MessageBox(Pchar(msg19 + gbxValorInicial.Caption), aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
      edtValor.SetFocus;
    Abort;
  end;

  if fAbreCaixa(iGbCodUsuario, StrToInt(edtCodCaixa.Text), edtValor.Text) then
  begin
    if application.MessageBox (msg20, aMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
    begin
      gbxValorInicial.Enabled := False;
      btnCancelar.Enabled     := False;
      btnAbrirCaixa.Enabled   := False;
    end;
  end
end;

procedure TfrmAbreCaixas.btnCancelarClick(Sender: TObject);
begin
  inherited;

  edtCodCaixa.Clear;
  edtCodCaixa.SetFocus;
  edtDescCaixa.Clear;
  edtValor.Clear;
end;

procedure TfrmAbreCaixas.btnCincoClick(Sender: TObject);
begin
  inherited;

  edtValor.Text := Trim(edtValor.Text) + btnCinco.Caption;
end;

procedure TfrmAbreCaixas.btnDoisClick(Sender: TObject);
begin
  inherited;

  edtValor.Text := Trim(edtValor.Text) + btnDois.Caption;
end;

procedure TfrmAbreCaixas.btnLimparClick(Sender: TObject);
begin
  inherited;

  edtValor.Clear;
  edtValor.SetFocus;
end;

procedure TfrmAbreCaixas.btnNoveClick(Sender: TObject);
begin
  inherited;

  edtValor.Text := Trim(edtValor.Text) + btnNove.Caption;
end;

procedure TfrmAbreCaixas.btnOitoClick(Sender: TObject);
begin
  inherited;

  edtValor.Text := Trim(edtValor.Text) + btnOito.Caption;
end;

procedure TfrmAbreCaixas.btnPesqCaixasClick(Sender: TObject);
begin
  inherited;

  if not Assigned(frmPesqCaixas) then
    frmPesqCaixas := TfrmPesqCaixas.Create(Self);
  frmPesqCaixas.ShowModal;
end;

procedure TfrmAbreCaixas.btnQuatroClick(Sender: TObject);
begin
  inherited;

  edtValor.Text := Trim(edtValor.Text) + btnQuatro.Caption;
end;

procedure TfrmAbreCaixas.btnSeisClick(Sender: TObject);
begin
  inherited;

  edtValor.Text := Trim(edtValor.Text) + btnSeis.Caption;
end;

procedure TfrmAbreCaixas.btnSeteClick(Sender: TObject);
begin
  inherited;

  edtValor.Text := Trim(edtValor.Text) + btnSete.Caption;
end;

procedure TfrmAbreCaixas.btnTresClick(Sender: TObject);
begin
  inherited;

  edtValor.Text := Trim(edtValor.Text) + btnTres.Caption;
end;

procedure TfrmAbreCaixas.btnUmClick(Sender: TObject);
begin
  inherited;

  edtValor.Text := Trim(edtValor.Text) + btnUm.Caption;
end;

procedure TfrmAbreCaixas.btnVirgulaClick(Sender: TObject);
begin
  inherited;

  edtValor.Text := Trim(edtValor.Text) + btnVirgula.Caption;
end;

procedure TfrmAbreCaixas.btnZeroClick(Sender: TObject);
begin
  inherited;

  edtValor.Text := Trim(edtValor.Text) + btnZero.Caption;
end;

procedure TfrmAbreCaixas.edtCodCaixaExit(Sender: TObject);
var
 sLcBuscaCaixas : string;
begin
  inherited;

  if not Trim(edtCodCaixa.Text).IsEmpty then
  begin
   sLcBuscaCaixas := fBuscaCaixas(edtCodCaixa.Text);
   if not sLcBuscaCaixas.IsEmpty then
   begin
     edtCodCaixa.Text  := Trim(SplitString(sLcBuscaCaixas, '-')[0]);
     edtDescCaixa.Text := Trim(SplitString(sLcBuscaCaixas, '-')[1]);
   end
   else
   begin
     edtDescCaixa.Clear;
     edtCodCaixa.SetFocus;
   end;
  end
  else
  begin
    edtCodCaixa.Clear;
    edtDescCaixa.Clear;
  end;

end;

procedure TfrmAbreCaixas.edtCodCaixaKeyPress(Sender: TObject; var Key: Char);
var
  sLcBuscaCaixas : string;
begin
  inherited;

  if not CharInSet(Key,[#08,#13,'0'..'9']) then
    key:=#0;

  if Key = #13 then
    if not Trim(edtCodCaixa.Text).IsEmpty then
    begin
     sLcBuscaCaixas := fBuscaCaixas(edtCodCaixa.Text);
     if not sLcBuscaCaixas.IsEmpty then
     begin
       edtCodCaixa.Text  := Trim(SplitString(sLcBuscaCaixas, '-')[0]);
       edtDescCaixa.Text := Trim(SplitString(sLcBuscaCaixas, '-')[1]);
     end
     else
     begin
       edtDescCaixa.Clear;
       edtCodCaixa.SetFocus;
     end;
    end;
end;

procedure TfrmAbreCaixas.edtValorChange(Sender: TObject);
begin
  inherited;

  // Estilo caixa de banco
  pFormataValor(edtValor);
end;

procedure TfrmAbreCaixas.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if not CharInSet(Key,['0'..'9', #8, #9]) then
    key:=#0;

  //Função para posicionar o cursor sempre na direita
  edtValor.selstart := Length(edtValor.text);
end;

procedure TfrmAbreCaixas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action        := caFree;
  frmAbreCaixas := nil;
end;

procedure TfrmAbreCaixas.FormCreate(Sender: TObject);
begin
  inherited;

  edtUsuario.Text := IntToStr(iGbCodUsuario) + ' - ' + sGbUsuarioLogado;
end;

procedure TfrmAbreCaixas.FormShow(Sender: TObject);
begin
  inherited;

  edtData.Text := DateToStr(Now);
  edtValor.Text := '0,00';
end;

end.
