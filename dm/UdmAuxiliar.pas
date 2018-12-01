unit UdmAuxiliar;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.FMTBcd, Data.SqlExpr;

type
  TdmAuxiliar = class(TDataModule)
    fdqAuxiliar: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAuxiliar: TdmAuxiliar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UdmPrincipal;

{$R *.dfm}

end.
