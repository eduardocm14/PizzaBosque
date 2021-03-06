unit UfrmConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfrmConfig = class(TForm)
    pgcConfiguracao: TPageControl;
    tbVendas: TTabSheet;
    pnlAbaVendas: TPanel;
    tab1: TTabSheet;
    tab2: TTabSheet;
    dbCbxZerarNumVendas: TDBCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

uses UdmConfig;

procedure TfrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action      := caFree;
  frmConfig   := nil;
end;

procedure TfrmConfig.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

end.
