object dmConfig: TdmConfig
  OldCreateOrder = False
  Height = 239
  Width = 507
  object fdqConfigEmpresa: TFDQuery
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select * from empresa')
    Left = 72
    Top = 128
    object fdqConfigEmpresaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqConfigEmpresarazao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao'
      Origin = 'razao'
      Size = 100
    end
    object fdqConfigEmpresafantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Size = 100
    end
    object fdqConfigEmpresacnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Size = 14
    end
    object fdqConfigEmpresaie: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ie'
      Origin = 'ie'
      Size = 9
    end
    object fdqConfigEmpresafone1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone1'
      Origin = 'fone1'
      Size = 10
    end
    object fdqConfigEmpresafone2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone2'
      Origin = 'fone2'
      Size = 10
    end
    object fdqConfigEmpresazeranumvenda: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'zeranumvenda'
      Origin = 'zeranumvenda'
      FixedChar = True
      Size = 1
    end
  end
  object dsConfigEmpresa: TDataSource
    DataSet = fdqConfigEmpresa
    Left = 256
    Top = 128
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 176
    Top = 16
  end
end
