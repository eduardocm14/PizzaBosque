inherited frmClientes: TfrmClientes
  ActiveControl = edtPesquisar
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Clientes'
  ClientHeight = 456
  ClientWidth = 718
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 724
  ExplicitHeight = 484
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 114
    Top = 44
    Width = 34
    Height = 14
    Caption = 'Nome'
    FocusControl = dbedtNome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 114
    Top = 80
    Width = 29
    Height = 14
    Caption = 'Fone'
    FocusControl = dbedtFone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 308
    Top = 80
    Width = 18
    Height = 14
    Caption = 'Cel'
    FocusControl = dbedtCel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 114
    Top = 119
    Width = 41
    Height = 14
    Caption = 'Cidade'
    FocusControl = dbedtCidade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 417
    Top = 119
    Width = 36
    Height = 14
    Caption = 'Bairro'
    FocusControl = dbedtBairro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 114
    Top = 156
    Width = 80
    Height = 14
    Caption = 'Rua/Avenida'
    FocusControl = dbedtRua
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl7: TLabel
    Left = 493
    Top = 80
    Width = 23
    Height = 14
    Caption = 'Cep'
    FocusControl = dbedtCep
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl8: TLabel
    Left = 114
    Top = 194
    Width = 47
    Height = 14
    Caption = 'N'#250'mero'
    FocusControl = dbedtRua
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl9: TLabel
    Left = 192
    Top = 194
    Width = 85
    Height = 14
    Caption = 'Complemento'
    FocusControl = dbedtRua
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnlBtn: TPanel
    Left = 7
    Top = 49
    Width = 97
    Height = 182
    TabOrder = 18
  end
  object pnlPesquisar: TPanel
    Left = 7
    Top = 4
    Width = 703
    Height = 41
    Caption = 'pnlPesquisar'
    TabOrder = 0
    object rgOpcao: TRadioGroup
      Left = 2
      Top = -2
      Width = 249
      Height = 41
      Caption = 'Pesquisar por:'
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Nome'
        'Fone'
        'Celular')
      ParentFont = False
      TabOrder = 0
      OnClick = rgOpcaoClick
    end
  end
  object dbgrdClientes: TDBGrid
    Left = 7
    Top = 235
    Width = 703
    Height = 217
    DataSource = dmClientes.dsClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = pmExcluir
    TabOrder = 17
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgrdClientesDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Caption = 'Nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 291
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Caption = 'Fone'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Caption = 'Celular'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Caption = 'Cidade'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 215
        Visible = True
      end>
  end
  object btnNovo: TButton
    Left = 18
    Top = 58
    Width = 75
    Height = 32
    Caption = 'Novo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnNovoClick
  end
  object btnAlterar: TButton
    Left = 18
    Top = 103
    Width = 75
    Height = 32
    Caption = 'Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnAlterarClick
  end
  object btnCancelar: TButton
    Left = 18
    Top = 147
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
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object btnSalvar: TButton
    Left = 18
    Top = 191
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
    TabOrder = 16
    OnClick = btnSalvarClick
  end
  object dbedtNome: TDBEdit
    Left = 114
    Top = 57
    Width = 487
    Height = 22
    DataField = 'nome'
    DataSource = dmClientes.dsClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object dbedtFone: TDBEdit
    Left = 114
    Top = 95
    Width = 134
    Height = 22
    DataField = 'fone'
    DataSource = dmClientes.dsClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnKeyPress = dbedtFoneKeyPress
  end
  object dbedtCel: TDBEdit
    Left = 308
    Top = 95
    Width = 134
    Height = 22
    DataField = 'cel'
    DataSource = dmClientes.dsClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnKeyPress = dbedtCelKeyPress
  end
  object dbedtCidade: TDBEdit
    Left = 114
    Top = 133
    Width = 295
    Height = 22
    DataField = 'cidade'
    DataSource = dmClientes.dsClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object dbedtBairro: TDBEdit
    Left = 417
    Top = 133
    Width = 293
    Height = 22
    DataField = 'bairro'
    DataSource = dmClientes.dsClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
  end
  object dbedtRua: TDBEdit
    Left = 114
    Top = 171
    Width = 596
    Height = 22
    DataField = 'rua'
    DataSource = dmClientes.dsClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
  end
  object dbedtCep: TDBEdit
    Left = 493
    Top = 95
    Width = 171
    Height = 22
    Hint = 'Para o CEP ser v'#225'lido tem que ter (8)digitos.'
    DataField = 'cep'
    DataSource = dmClientes.dsClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnExit = dbedtCepExit
    OnKeyPress = dbedtCepKeyPress
  end
  object dbedtNum: TDBEdit
    Left = 114
    Top = 209
    Width = 72
    Height = 22
    DataField = 'numero'
    DataSource = dmClientes.dsClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
  end
  object dbedtComplemento: TDBEdit
    Left = 192
    Top = 209
    Width = 518
    Height = 22
    DataField = 'complemento'
    DataSource = dmClientes.dsClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 100
    ParentFont = False
    TabOrder = 15
  end
  object btnCep: TBitBtn
    Left = 667
    Top = 95
    Width = 43
    Height = 22
    Caption = 'CEP'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 10
    OnClick = btnCepClick
  end
  object edtPesquisar: TEdit
    Left = 270
    Top = 15
    Width = 424
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnKeyPress = edtPesquisarKeyPress
  end
  object dbrgAtivo: TDBRadioGroup
    Left = 601
    Top = 44
    Width = 109
    Height = 42
    Caption = 'Ativo'
    Columns = 2
    DataField = 'ativo'
    DataSource = dmClientes.dsClientes
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Items.Strings = (
      'Sim'
      'N'#227'o')
    ParentFont = False
    TabOrder = 6
    Values.Strings = (
      'S'
      'N')
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
