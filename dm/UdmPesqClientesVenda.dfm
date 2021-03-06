object dmPesqClientesVenda: TdmPesqClientesVenda
  OldCreateOrder = False
  Height = 308
  Width = 495
  object dsPesqClientesVendas: TDataSource
    DataSet = fdqryPesqClientesVendas
    Left = 312
    Top = 200
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 232
    Top = 24
  end
  object fdqryPesqClientesVendas: TFDQuery
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select '
      '  nome,'
      '  fone,'
      '  cel,'
      '  cidade,'
      '  CONCAT(bairro, '#39' - '#39' ,rua, '#39','#39', numero) endereco'
      'from clientes;')
    Left = 80
    Top = 208
    object fdqryPesqClientesVendasnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object fdqryPesqClientesVendasfone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone'
      Origin = 'fone'
      Size = 10
    end
    object fdqryPesqClientesVendascel: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cel'
      Origin = 'cel'
      Size = 10
    end
    object fdqryPesqClientesVendascidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 60
    end
    object fdqryPesqClientesVendasendereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'endereco'
      Origin = 'endereco'
      ProviderFlags = []
      ReadOnly = True
      Size = 135
    end
  end
  object fdqryPesqClientesFone: TFDQuery
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select * from clientes'
      'where fone =:pFone or cel =:pfone')
    Left = 72
    Top = 104
    ParamData = <
      item
        Name = 'PFONE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField1: TFDAutoIncField
      Alignment = taCenter
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fone'
      Origin = 'fone'
      Size = 10
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cel'
      Origin = 'cel'
      Size = 10
    end
    object StringField4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 60
    end
    object StringField5: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 60
    end
    object StringField6: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'rua'
      Origin = 'rua'
      Size = 60
    end
    object StringField7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cep'
      Origin = 'cep'
      Size = 8
    end
    object StringField8: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'complemento'
      Origin = 'complemento'
      Size = 100
    end
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'numero'
      Origin = 'numero'
    end
    object StringField9: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ativo'
      Origin = 'ativo'
      FixedChar = True
      Size = 1
    end
  end
  object dsPesqClientesFone: TDataSource
    DataSet = fdqryPesqClientesFone
    Left = 304
    Top = 104
  end
end
