object dmEmpresa: TdmEmpresa
  OldCreateOrder = False
  Height = 211
  Width = 397
  object fdqEmpresa: TFDQuery
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select * from empresa')
    Left = 72
    Top = 96
    object fdqEmpresaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqEmpresarazao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao'
      Origin = 'razao'
      Size = 100
    end
    object fdqEmpresafantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Size = 100
    end
    object fdqEmpresacnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Size = 14
    end
    object fdqEmpresaie: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ie'
      Origin = 'ie'
      Size = 9
    end
    object fdqEmpresafone1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone1'
      Origin = 'fone1'
      Size = 10
    end
    object fdqEmpresafone2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone2'
      Origin = 'fone2'
      Size = 10
    end
  end
  object dsEmpresa: TDataSource
    DataSet = fdqEmpresa
    Left = 264
    Top = 96
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 160
    Top = 16
  end
end
