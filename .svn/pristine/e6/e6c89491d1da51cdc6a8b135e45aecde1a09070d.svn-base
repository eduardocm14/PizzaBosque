unit UdmClientes;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmClientes = class(TDataModule)
    fdqryClientes: TFDQuery;
    dsClientes: TDataSource;
    fdqryClientesid: TFDAutoIncField;
    fdqryClientesnome: TStringField;
    fdqryClientesfone: TStringField;
    fdqryClientescel: TStringField;
    fdqryClientescidade: TStringField;
    fdqryClientesbairro: TStringField;
    fdqryClientesrua: TStringField;
    fdqryClientescep: TStringField;
    fdqryClientescomplemento: TStringField;
    fdqryClientesnumero: TIntegerField;
    fdqryClientesativo: TStringField;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmClientes: TdmClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UdmPrincipal;

{$R *.dfm}

end.
