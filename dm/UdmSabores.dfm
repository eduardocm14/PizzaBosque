object dmSabores: TdmSabores
  OldCreateOrder = False
  Height = 195
  Width = 377
  object fdqrySabores: TFDQuery
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select *, '
      #9'case especial'
      #9#9'when '#39'N'#39' then '#39'N'#227'o'#39
      #9#9'else '#39'Sim'#39
      #9'end esptipo'#9
      'from sabores')
    Left = 80
    Top = 48
    object fdqrySaboresid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqrySaboresdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 80
    end
    object fdqrySaboresespecial: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'especial'
      Origin = 'especial'
      FixedChar = True
      Size = 1
    end
    object fdqrySaboresesptipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'esptipo'
      Origin = 'esptipo'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
  end
  object dsSabores: TDataSource
    DataSet = fdqrySabores
    Left = 256
    Top = 48
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 256
    Top = 120
  end
end
