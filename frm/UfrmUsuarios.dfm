inherited frmUsuarios: TfrmUsuarios
  ActiveControl = edtPesquisar
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 440
  ClientWidth = 674
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 680
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCadastros: TPanel
    Left = 100
    Top = 45
    Width = 573
    Height = 164
    TabOrder = 6
    object lbl1: TLabel
      Left = 6
      Top = 55
      Width = 34
      Height = 14
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 6
      Top = 102
      Width = 45
      Height = 14
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 395
      Top = 102
      Width = 38
      Height = 14
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbedtNome: TDBEdit
      Left = 6
      Top = 69
      Width = 560
      Height = 22
      DataField = 'nome'
      DataSource = dmUsuarios.dsUsuarios
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dbedtUsuario: TDBEdit
      Left = 6
      Top = 116
      Width = 339
      Height = 22
      CharCase = ecLowerCase
      DataField = 'usuario'
      DataSource = dmUsuarios.dsUsuarios
      DragCursor = crHandPoint
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dbedtSenha: TDBEdit
      Left = 395
      Top = 116
      Width = 171
      Height = 22
      DataField = 'senha'
      DataSource = dmUsuarios.dsUsuarios
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PasswordChar = '#'
      ShowHint = True
      TabOrder = 3
    end
    object dbrgNivel: TDBRadioGroup
      Left = 6
      Top = 4
      Width = 323
      Height = 41
      Caption = 'Nivel de Acesso'
      Columns = 2
      DataField = 'nivel'
      DataSource = dmUsuarios.dsUsuarios
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'Gerente'
        'Caixa')
      ParentFont = False
      TabOrder = 0
      Values.Strings = (
        '0'
        '1')
    end
  end
  object dbgrdUsuarios: TDBGrid
    Left = 1
    Top = 211
    Width = 672
    Height = 227
    DataSource = dmUsuarios.dsUsuarios
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = pmExcluir
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgrdUsuariosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nivelDesc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Caption = 'Nivel'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 141
        Visible = True
      end>
  end
  object pnlBtn: TPanel
    Left = 1
    Top = 3
    Width = 97
    Height = 206
    TabOrder = 0
  end
  object btnNovo: TButton
    Left = 12
    Top = 24
    Width = 75
    Height = 32
    Caption = 'Novo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnNovoClick
  end
  object btnAlterar: TButton
    Left = 12
    Top = 69
    Width = 75
    Height = 32
    Caption = 'Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnAlterarClick
  end
  object btnCancelar: TButton
    Left = 12
    Top = 113
    Width = 75
    Height = 32
    Caption = 'Cancelar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object btnSalvar: TButton
    Left = 12
    Top = 158
    Width = 75
    Height = 32
    Caption = 'Salvar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnSalvarClick
  end
  object pnlPesquisar: TPanel
    Left = 100
    Top = 3
    Width = 573
    Height = 41
    Caption = 'pnlPesquisar'
    TabOrder = 4
    object lblPesq: TLabel
      Left = 42
      Top = 12
      Width = 68
      Height = 16
      Caption = 'Pesquisar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object edtPesquisar: TEdit
    Left = 213
    Top = 13
    Width = 414
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnKeyPress = edtPesquisarKeyPress
  end
  object pmExcluir: TPopupMenu
    Left = 144
    Top = 368
    object Exluir1: TMenuItem
      Caption = 'Exluir'
      OnClick = Exluir1Click
    end
  end
end
