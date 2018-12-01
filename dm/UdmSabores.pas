unit UdmSabores;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmSabores = class(TDataModule)
    fdqrySabores: TFDQuery;
    dsSabores: TDataSource;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    fdqrySaboresid: TFDAutoIncField;
    fdqrySaboresdescricao: TStringField;
    fdqrySaboresespecial: TStringField;
    fdqrySaboresesptipo: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSabores: TdmSabores;

implementation

uses
  UdmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
