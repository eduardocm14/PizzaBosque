unit UdmPesqClientesVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmPesqClientesVenda = class(TDataModule)
    dsPesqClientesVendas: TDataSource;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    fdqryPesqClientesVendas: TFDQuery;
    fdqryPesqClientesFone: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    IntegerField1: TIntegerField;
    StringField9: TStringField;
    dsPesqClientesFone: TDataSource;
    fdqryPesqClientesVendasnome: TStringField;
    fdqryPesqClientesVendasfone: TStringField;
    fdqryPesqClientesVendascel: TStringField;
    fdqryPesqClientesVendascidade: TStringField;
    fdqryPesqClientesVendasendereco: TStringField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPesqClientesVenda: TdmPesqClientesVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UdmPrincipal;

{$R *.dfm}

end.
