unit UfrmProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, UfrmPadrao,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  UfrmConfig, Vcl.ComCtrls;

type
  TfrmProdutos = class(TfrmConfig)
    pnlCadastros: TPanel;
    lbProdDesc: TLabel;
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
    lb1: TLabel;
    lb2: TLabel;
    dbedtTamanho: TDBEdit;
    dbedtFatias: TDBEdit;
    dbedtValor: TDBEdit;
    lbValor: TLabel;
    dbrgTipo: TDBRadioGroup;
    Label1: TLabel;
    dbedtCodInterno: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure dbgRegistrosDblClick(Sender: TObject);
    procedure dbrgTipoClick(Sender: TObject);
    procedure Exluir1Click(Sender: TObject);
    procedure dbedtCodInternoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses uMensagens, UdmProdutos, uFuncoes;

procedure TfrmProdutos.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if not dmProdutos.fdqryProdutos.IsEmpty then
  begin
    dmProdutos.fdqryProdutos.Edit;
    pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
    pDbEditCadastro(Self, dbedtCodInterno);
    dbrgTipo.Enabled     := True;
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

procedure TfrmProdutos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmProdutos.fdqryProdutos.Cancel;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbrgTipo.Enabled     := False;
  dbgRegistros.Enabled := True;
  dbgRegistros.Refresh;
end;

procedure TfrmProdutos.btnNovoClick(Sender: TObject);
begin
  inherited;
  dmProdutos.fdqryProdutos.Append;
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtCodInterno);
  dbrgTipo.Enabled     := True;
  dbrgTipo.ItemIndex   := 0;
  dbgRegistros.Enabled := False;
  dbgRegistros.Refresh;
end;

procedure TfrmProdutos.btnSalvarClick(Sender: TObject);
begin
  inherited;
  dmProdutos.fdqryProdutos.Post;
  dmProdutos.fdqryProdutos.Refresh;
  if application.MessageBox (msg3, cMsg, MB_OK + MB_ICONINFORMATION) = IDOK then
  pBtnCadastros(btnNovo, btnAlterar, btnCancelar, btnSalvar);
  pDbEditCadastro(Self, dbedtNome);
  dbrgTipo.Enabled     := False;
  dbgRegistros.Enabled := True;
  dbgRegistros.Refresh;
end;

procedure TfrmProdutos.dbedtCodInternoExit(Sender: TObject);
begin
  inherited;

  if not Trim(dbedtCodInterno.Text).IsEmpty then
  begin
    if dmProdutos.fdqryProdutos.State = dsInsert then
    begin
      if not (fRegistroExiste('produtos', 'codinterno', dbedtCodInterno.Text)) then
        btnSalvar.Enabled := False
      else
        btnSalvar.Enabled := True;
    end;
  end;
end;

procedure TfrmProdutos.dbgRegistrosDblClick(Sender: TObject);
begin
  inherited;
  if btnAlterar.CanFocus then
    btnAlterar.Click;
end;

procedure TfrmProdutos.dbrgTipoClick(Sender: TObject);
begin
  inherited;

  if dbrgTipo.ItemIndex = 1 then
  begin
    lbProdDesc.Caption   := 'Bebida(Descri��o)';
    dbedtTamanho.Enabled := False;
    dbedtFatias.Enabled  := False;
  end
  else
  begin
    lbProdDesc.Caption   := 'Tamanho das Pizzas(Descri��o)';
    dbedtTamanho.Enabled := True;
    dbedtFatias.Enabled  := True;
  end;

end;

procedure TfrmProdutos.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  pPesqLocate(dmProdutos.fdqryProdutos, edtPesquisar, 'descricao');
end;

procedure TfrmProdutos.Exluir1Click(Sender: TObject);
begin
  inherited;

  if dmProdutos.fdqryProdutosid.AsInteger > 1 then
  begin
    if application.MessageBox(Pchar(msg4 + dmProdutos.fdqryProdutosdescricao.AsString), cMsg, MB_YESNO + MB_ICONINFORMATION) = IDYES then
    begin
      dmProdutos.fdqryProdutos.Delete;
      dmProdutos.fdqryProdutos.Refresh;
    end;
  end
end;

procedure TfrmProdutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  dmProdutos.fdqryProdutos.Close;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmProdutos) then
    dmProdutos := TdmProdutos.Create(Self);
  dmProdutos.fdqryProdutos.Open;
end;

procedure TfrmProdutos.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmProdutos);
end;

end.
