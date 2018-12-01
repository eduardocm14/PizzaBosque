object dmProdutos: TdmProdutos
  OldCreateOrder = False
  Height = 195
  Width = 353
  object fdqryProdutos: TFDQuery
    BeforePost = fdqryProdutosBeforePost
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select * from produtos')
    Left = 80
    Top = 48
    object fdqryProdutosid: TFDAutoIncField
      Alignment = taCenter
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqryProdutoscodinterno: TIntegerField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo Interno'
      FieldName = 'codinterno'
      Origin = 'codinterno'
      Required = True
    end
    object fdqryProdutosdescricao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 80
    end
    object fdqryProdutoscm: TIntegerField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'cm'
      Origin = 'cm'
    end
    object fdqryProdutosfatias: TIntegerField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'fatias'
      Origin = 'fatias'
    end
    object fdqryProdutosvalor: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      DisplayFormat = '#,###0.00'
      Precision = 10
      Size = 2
    end
    object fdqryProdutostipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      FixedChar = True
      Size = 1
    end
  end
  object dsProdutos: TDataSource
    DataSet = fdqryProdutos
    Left = 256
    Top = 48
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 256
    Top = 120
  end
end
