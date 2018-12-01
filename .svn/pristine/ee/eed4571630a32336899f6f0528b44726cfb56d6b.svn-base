unit UdmCaixas;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmCaixas = class(TDataModule)
    dsCaixas: TDataSource;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    fdqCaixas: TFDQuery;
    fdqCaixasid: TFDAutoIncField;
    fdqCaixasdescricao: TStringField;
    dsCaixaPesq: TDataSource;
    fdqCaixasPesq: TFDQuery;
    fdqCaixasPesqid: TFDAutoIncField;
    fdqCaixasPesqdescricao: TStringField;
    dsPesqCaixasAbertos: TDataSource;
    fdqPesqCaixasAbertos: TFDQuery;
    fdqPesqCaixasAbertosid: TFDAutoIncField;
    fdqPesqCaixasAbertoscaixa: TIntegerField;
    fdqPesqCaixasAbertosdata_abert: TDateTimeField;
    fdqPesqCaixasAbertosusuario_abert: TIntegerField;
    fdqPesqCaixasAbertosvalor_abert: TBCDField;
    fdqPesqCaixasAbertosdata_fech: TDateTimeField;
    fdqPesqCaixasAbertosusuario_fech: TIntegerField;
    fdqPesqCaixasAbertosvalor_fech: TBCDField;
    fdqPesqCaixasAbertosstatus: TStringField;
    fdqPesqCaixasAbertoscod: TIntegerField;
    fdqPesqCaixasAbertosnome: TStringField;
    fdqPesqCaixasAbertosdescricao: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCaixas: TdmCaixas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UdmPrincipal;

{$R *.dfm}

end.
