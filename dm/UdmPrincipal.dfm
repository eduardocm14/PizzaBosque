object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 221
  Width = 358
  object fdphyMysqlBancoDados: TFDPhysMySQLDriverLink
    Left = 168
    Top = 24
  end
  object fdConBancoDados: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Password=admin159753'
      'Server=127.0.0.1'
      'Database=pizzaria'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 152
    Top = 136
  end
end
