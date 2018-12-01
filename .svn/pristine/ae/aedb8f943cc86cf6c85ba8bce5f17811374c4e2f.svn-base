object dmClientes: TdmClientes
  OldCreateOrder = False
  Height = 196
  Width = 386
  object fdqryClientes: TFDQuery
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select * from clientes')
    Left = 80
    Top = 48
    object fdqryClientesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqryClientesnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object fdqryClientesfone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone'
      Origin = 'fone'
      Size = 10
    end
    object fdqryClientescel: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cel'
      Origin = 'cel'
      Size = 10
    end
    object fdqryClientescidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 60
    end
    object fdqryClientesbairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 60
    end
    object fdqryClientesrua: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'rua'
      Origin = 'rua'
      Size = 60
    end
    object fdqryClientescep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cep'
      Origin = 'cep'
      Size = 8
    end
    object fdqryClientescomplemento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'complemento'
      Origin = 'complemento'
      Size = 50
    end
    object fdqryClientesnumero: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numero'
      Origin = 'numero'
    end
    object fdqryClientesativo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ativo'
      Origin = 'ativo'
      FixedChar = True
      Size = 1
    end
  end
  object dsClientes: TDataSource
    DataSet = fdqryClientes
    Left = 256
    Top = 48
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 256
    Top = 120
  end
end
