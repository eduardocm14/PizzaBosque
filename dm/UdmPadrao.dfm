object dmPadrao: TdmPadrao
  OldCreateOrder = False
  Height = 198
  Width = 471
  object dsPadrao: TDataSource
    DataSet = fdqPadrao
    Left = 256
    Top = 48
  end
  object fdqPadrao: TFDQuery
    Connection = dmPrincipal.conPizzaria
    SQL.Strings = (
      'select * from empresa')
    Left = 80
    Top = 48
    object fdqPadraoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqPadraorazao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao'
      Origin = 'razao'
      Size = 100
    end
    object fdqPadraofantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Size = 100
    end
    object fdqPadraocnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Size = 14
    end
    object fdqPadraoie: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ie'
      Origin = 'ie'
      Size = 9
    end
    object fdqPadraofone1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone1'
      Origin = 'fone1'
      Size = 10
    end
    object fdqPadraofone2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone2'
      Origin = 'fone2'
      Size = 10
    end
  end
  object fdgxwcPadrao: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 256
    Top = 120
  end
end
