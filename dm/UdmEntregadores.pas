unit UdmEntregadores;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.UI,
  FireDAC.Comp.Client;

type
  TdmEntregadores = class(TDataModule)
    fdqryEntregadores: TFDQuery;
    dsEntregadores: TDataSource;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    fdqryEntregadoresid: TFDAutoIncField;
    fdqryEntregadoresdescricao: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEntregadores: TdmEntregadores;

implementation

uses
  UdmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
