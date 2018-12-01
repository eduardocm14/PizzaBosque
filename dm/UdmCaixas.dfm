object dmCaixas: TdmCaixas
  OldCreateOrder = False
  Height = 241
  Width = 385
  object dsCaixas: TDataSource
    DataSet = fdqCaixas
    Left = 256
    Top = 48
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 168
    Top = 16
  end
  object fdqCaixas: TFDQuery
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select * from caixas')
    Left = 80
    Top = 48
    object fdqCaixasid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqCaixasdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 80
    end
  end
  object dsCaixaPesq: TDataSource
    DataSet = fdqCaixasPesq
    Left = 256
    Top = 112
  end
  object fdqCaixasPesq: TFDQuery
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select * from caixas')
    Left = 72
    Top = 112
    object fdqCaixasPesqid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqCaixasPesqdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 80
    end
  end
  object dsPesqCaixasAbertos: TDataSource
    DataSet = fdqPesqCaixasAbertos
    Left = 256
    Top = 176
  end
  object fdqPesqCaixasAbertos: TFDQuery
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select mc.*, u.id cod, u.nome, c.descricao from movcaixas mc'
      'inner join usuarios u on (u.id = mc.usuario_abert)'
      'inner join caixas   c on (c.id = mc.caixa)'
      'where mc.`status` = '#39'A'#39
      '')
    Left = 72
    Top = 176
    object fdqPesqCaixasAbertosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqPesqCaixasAbertoscaixa: TIntegerField
      FieldName = 'caixa'
      Origin = 'caixa'
      Required = True
    end
    object fdqPesqCaixasAbertosdata_abert: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data_abert'
      Origin = 'data_abert'
    end
    object fdqPesqCaixasAbertosusuario_abert: TIntegerField
      FieldName = 'usuario_abert'
      Origin = 'usuario_abert'
      Required = True
    end
    object fdqPesqCaixasAbertosvalor_abert: TBCDField
      FieldName = 'valor_abert'
      Origin = 'valor_abert'
      Required = True
      Precision = 10
      Size = 2
    end
    object fdqPesqCaixasAbertosdata_fech: TDateTimeField
      FieldName = 'data_fech'
      Origin = 'data_fech'
      Required = True
    end
    object fdqPesqCaixasAbertosusuario_fech: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'usuario_fech'
      Origin = 'usuario_fech'
    end
    object fdqPesqCaixasAbertosvalor_fech: TBCDField
      FieldName = 'valor_fech'
      Origin = 'valor_fech'
      Required = True
      Precision = 10
      Size = 2
    end
    object fdqPesqCaixasAbertosstatus: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'status'
      Origin = 'status'
      FixedChar = True
      Size = 1
    end
    object fdqPesqCaixasAbertoscod: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod'
      Origin = 'id'
      ProviderFlags = []
      ReadOnly = True
    end
    object fdqPesqCaixasAbertosnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object fdqPesqCaixasAbertosdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
  end
end
