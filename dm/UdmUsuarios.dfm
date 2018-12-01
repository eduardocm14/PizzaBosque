object dmUsuarios: TdmUsuarios
  OldCreateOrder = False
  Height = 303
  Width = 372
  object fdqryUsuarios: TFDQuery
    BeforePost = fdqryUsuariosBeforePost
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select * from usuarios')
    Left = 80
    Top = 48
    object fdqryUsuariosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object fdqryUsuariosnome: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object fdqryUsuariosusuario: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
      Size = 30
    end
    object fdqryUsuariossenha: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Senha'
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 30
    end
    object fdqryUsuariosnivel: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'nivel'
      Origin = 'nivel'
    end
    object fdqryUsuariosativo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ativo'
      Origin = 'ativo'
    end
  end
  object dsUsuarios: TDataSource
    DataSet = fdqryUsuarios
    Left = 256
    Top = 48
  end
  object fdqryLogin: TFDQuery
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      '')
    Left = 80
    Top = 121
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 160
    Top = 8
  end
  object fdqPesqCaixaOperador: TFDQuery
    Connection = dmPrincipal.fdConBancoDados
    SQL.Strings = (
      'select id, nome from usuarios'
      ' where ativo = 1')
    Left = 80
    Top = 192
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
  end
  object dsPesqCaixaOperador: TDataSource
    DataSet = fdqPesqCaixaOperador
    Left = 256
    Top = 192
  end
end
