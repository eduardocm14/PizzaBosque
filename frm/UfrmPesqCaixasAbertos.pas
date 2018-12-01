unit UfrmPesqCaixasAbertos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmPadrao, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmPesqCaixasAbertos = class(TfrmPadrao)
    dbgPesqCaixasAbertos: TDBGrid;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgPesqCaixasAbertosDblClick(Sender: TObject);
    procedure dbgPesqCaixasAbertosKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionaCaixa;
  public
    { Public declarations }
  end;

var
  frmPesqCaixasAbertos: TfrmPesqCaixasAbertos;

implementation

{$R *.dfm}

uses UdmCaixas, uFuncoes, UfrmVendas, uMensagens;

procedure TfrmPesqCaixasAbertos.dbgPesqCaixasAbertosDblClick(Sender: TObject);
begin
  inherited;

  SelecionaCaixa;
end;

procedure TfrmPesqCaixasAbertos.dbgPesqCaixasAbertosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if Key = #13 then
  begin
    SelecionaCaixa;
  end;
end;

procedure TfrmPesqCaixasAbertos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;

  dmCaixas.fdqPesqCaixasAbertos.Close;
end;

procedure TfrmPesqCaixasAbertos.FormCreate(Sender: TObject);
begin
  inherited;

  if not Assigned(dmCaixas) then
    dmCaixas := TdmCaixas.Create(Self);
  dmCaixas.fdqPesqCaixasAbertos.Open;
end;

procedure TfrmPesqCaixasAbertos.FormDestroy(Sender: TObject);
begin
  inherited;

  FreeAndNil(dmCaixas);
end;

procedure TfrmPesqCaixasAbertos.FormShow(Sender: TObject);
begin
  inherited;

  if fNivelUsuario(iGbCodUsuario) > 0 then
  begin
    with dmCaixas.fdqPesqCaixasAbertos do
    begin
      Filtered := False;
      Filter   := 'COD = ' + QuotedStr(IntToStr(iGbCodUsuario));
      Filtered := True;
    end;
  end;
end;

procedure TfrmPesqCaixasAbertos.SelecionaCaixa;
begin
  iGbNumCaixaAberto := dmCaixas.fdqPesqCaixasAbertosid.AsInteger;
  sGbDtCaixaAberto  := dmCaixas.fdqPesqCaixasAbertosdata_abert.AsString;
  sGbDescCaixa      := dmCaixas.fdqPesqCaixasAbertosdescricao.AsString;

  ModalResult       := mrOk;
end;

end.
