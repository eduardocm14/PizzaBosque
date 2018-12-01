unit UdmConsultaVendaProdutos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmConsultaVendaProdutos = class(TDataModule)
    dsVendasProdutos: TDataSource;
    fdqVendasProdutos: TFDQuery;
    fdqVendasProdutosid: TFDAutoIncField;
    fdqVendasProdutosnumvenda: TIntegerField;
    fdqVendasProdutoscodproduto: TIntegerField;
    fdqVendasProdutosdescricao: TStringField;
    fdqVendasProdutosvalor: TBCDField;
    fdqVendasPgto: TFDQuery;
    fdqVendasPgtonumvenda: TIntegerField;
    fdqVendasPgtocodformapgto: TIntegerField;
    fdqVendasPgtodescricao: TStringField;
    fdqVendasPgtovalor: TBCDField;
    dsVendasPgto: TDataSource;
    fdqTotalFormaPagto: TFDQuery;
    fdqTotalFormaPagtonumcaixa: TIntegerField;
    fdqTotalFormaPagtonumvenda: TIntegerField;
    fdqTotalFormaPagtocodformapgto: TIntegerField;
    fdqTotalFormaPagtodescricao: TStringField;
    fdqTotalFormaPagtovl_total: TFMTBCDField;
    fdqTotalFormaPagtodata: TDateTimeField;
    fdqTotalFormaPagtoTotalGeral: TAggregateField;
    dsTotalFormaPagto: TDataSource;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    dsConsultaVendas: TDataSource;
    fdqConsultaVendas: TFDQuery;
    fdqConsultaVendasid: TFDAutoIncField;
    fdqConsultaVendasnumcaixa: TIntegerField;
    fdqConsultaVendascodoper: TIntegerField;
    fdqConsultaVendasoperador: TStringField;
    fdqConsultaVendascodcliente: TIntegerField;
    fdqConsultaVendascliente: TStringField;
    fdqConsultaVendascodentregador: TIntegerField;
    fdqConsultaVendasentregador: TStringField;
    fdqConsultaVendasdata_venda: TDateTimeField;
    fdqConsultaVendasstatus: TStringField;
    fdqConsultaVendasvenda_canc: TStringField;
    fdqConsultaVendastotal_venda: TFMTBCDField;
    fdqConsultaVendasobs: TStringField;
    dsConsultaVendasCanceladas: TDataSource;
    fdqConsultaVendasCanceladas: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    IntegerField4: TIntegerField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    StringField4: TStringField;
    StringField5: TStringField;
    FMTBCDField1: TFMTBCDField;
    StringField6: TStringField;
    fdqConsultaVendasCanceladastotal_cancelado: TAggregateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConsultaVendaProdutos: TdmConsultaVendaProdutos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UdmPrincipal;

{$R *.dfm}

end.
