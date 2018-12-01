unit UdmConfig;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmConfig = class(TDataModule)
    fdqConfigEmpresa: TFDQuery;
    fdqConfigEmpresaid: TFDAutoIncField;
    fdqConfigEmpresarazao: TStringField;
    fdqConfigEmpresafantasia: TStringField;
    fdqConfigEmpresacnpj: TStringField;
    fdqConfigEmpresaie: TStringField;
    fdqConfigEmpresafone1: TStringField;
    fdqConfigEmpresafone2: TStringField;
    dsConfigEmpresa: TDataSource;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    fdqConfigEmpresazeranumvenda: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConfig: TdmConfig;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UdmPrincipal;

{$R *.dfm}

end.
