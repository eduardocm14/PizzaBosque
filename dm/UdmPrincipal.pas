unit UdmPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait, IniFiles, Vcl.Forms, Winapi.Windows;

type
  TdmPrincipal = class(TDataModule)
    fdphyMysqlBancoDados: TFDPhysMySQLDriverLink;
    fdConBancoDados: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
    
  private
    { Private declarations }
    procedure ConectaMariaDB(pConexao:TFDConnection; pConfgIni:string);
  public
    { Public declarations }
    sPbConexao : string;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmPrincipal }

{ TdmPrincipal }

procedure TdmPrincipal.ConectaMariaDB(pConexao: TFDConnection;
  pConfgIni: string);
var
  ArqIni   : TIniFile;
begin
  try
    ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + pConfgIni);
    try
      with pConexao do
      begin
        Params.Values['Database']  := ArqIni.ReadString('Pizzaria','Database','');
        Params.Values['Server']    := ArqIni.ReadString('Pizzaria','Server','');
        sPbConexao := Params.Values['Server'] + ' - ' + Params.Values['Database'];
        Connected  := True;
      end;
    except on e:exception do
      if Application.MessageBox(PChar('Exception: ' + e.Message + '[N�o foi possivel conectar:' + sPbConexao + ']'),
                                      'Aten��o', MB_OK + MB_ICONERROR) = IDOK then
        Application.Terminate;
    end;
  finally
    FreeAndNil(ArqIni);
  end;

end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  ConectaMariaDB(fdConBancoDados, 'ConexaoMariaBD.ini');
end;

end.
