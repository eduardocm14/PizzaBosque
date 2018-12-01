object dmEntregadores: TdmEntregadores
  OldCreateOrder = False
  Height = 182
  Width = 374
  object fdqryEntregadores: TFDQuery
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select * from entregadores')
    Left = 80
    Top = 48
    object fdqryEntregadoresid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqryEntregadoresdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
  end
  object dsEntregadores: TDataSource
    DataSet = fdqryEntregadores
    Left = 256
    Top = 48
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 256
    Top = 120
  end
end
