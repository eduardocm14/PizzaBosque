unit UdmEmpresa;

interface

uses
  System.SysUtils, System.Classes, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI, FireDAC.Comp.Client;

type
  TdmEmpresa = class(TDataModule)
    fdqEmpresa: TFDQuery;
    dsEmpresa: TDataSource;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    fdqEmpresaid: TFDAutoIncField;
    fdqEmpresarazao: TStringField;
    fdqEmpresafantasia: TStringField;
    fdqEmpresacnpj: TStringField;
    fdqEmpresaie: TStringField;
    fdqEmpresafone1: TStringField;
    fdqEmpresafone2: TStringField;
    procedure unQryEmpresaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEmpresa: TdmEmpresa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoes, UdmPrincipal;

{$R *.dfm}

procedure TdmEmpresa.unQryEmpresaBeforePost(DataSet: TDataSet);
begin
  if not(fCamposObrigatorios(Dataset)) then
  begin
    Abort;
  end;
end;

end.