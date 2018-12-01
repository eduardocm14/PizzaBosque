unit UfrmTestes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmTestes = class(TForm)
    dbgTeste1: TDBGrid;
    dbgTeste2: TDBGrid;
    lbVenda: TLabel;
    dbedtNumeroVenda: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestes: TfrmTestes;

implementation

{$R *.dfm}

procedure TfrmTestes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
 frmTestes := nil;
end;

end.
