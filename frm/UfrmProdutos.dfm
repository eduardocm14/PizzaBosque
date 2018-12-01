inherited frmProdutos: TfrmProdutos
  ActiveControl = edtPesquisar
  BorderIcons = [biSystemMenu]
  Caption = 'Produtos(Card'#225'pio)'
  ClientHeight = 440
  ClientWidth = 586
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 592
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCadastros: TPanel [0]
    Left = 100
    Top = 45
    Width = 485
    Height = 164
    TabOrder = 6
    object lbProdDesc: TLabel
      Left = 6
      Top = 46
      Width = 188
      Height = 14
      Caption = 'Tamanho das Pizzas(Descri'#231#227'o)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lb1: TLabel
      Left = 6
      Top = 103
      Width = 83
      Height = 14
      Caption = 'Tamanho(cm)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lb2: TLabel
      Left = 214
      Top = 103
      Width = 67
      Height = 14
      Caption = 'Fatias(qtd)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbValor: TLabel
      Left = 387
      Top = 103
      Width = 58
      Height = 14
      Caption = 'Valor(R$)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 6
      Top = 7
      Width = 98
      Height = 14
      Caption = 'C'#243'digo Interno:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbedtNome: TDBEdit
      Left = 6
      Top = 62
      Width = 467
      Height = 22
      DataField = 'descricao'
      DataSource = dmProdutos.dsProdutos
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dbedtTamanho: TDBEdit
      Left = 14
      Top = 119
      Width = 67
      Height = 22
      DataField = 'cm'
      DataSource = dmProdutos.dsProdutos
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object dbedtFatias: TDBEdit
      Left = 214
      Top = 119
      Width = 67
      Height = 22
      DataField = 'fatias'
      DataSource = dmProdutos.dsProdutos
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object dbedtValor: TDBEdit
      Left = 382
      Top = 119
      Width = 67
      Height = 22
      DataField = 'valor'
      DataSource = dmProdutos.dsProdutos
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object dbrgTipo: TDBRadioGroup
      Left = 233
      Top = 4
      Width = 240
      Height = 56
      Caption = 'Tipo'
      Columns = 2
      DataField = 'tipo'
      DataSource = dmProdutos.dsProdutos
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Items.Strings = (
        'Pizza'
        'Bebida/Outros')
      ParentFont = False
      TabOrder = 2
      Values.Strings = (
        'P'
        'B')
      OnClick = dbrgTipoClick
    end
    object dbedtCodInterno: TDBEdit
      Left = 106
      Top = 4
      Width = 67
      Height = 22
      DataField = 'codinterno'
      DataSource = dmProdutos.dsProdutos
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = dbedtCodInternoExit
    end
  end
  object dbgRegistros: TDBGrid [1]
    Left = 1
    Top = 211
    Width = 584
    Height = 227
    DataSource = dmProdutos.dsProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = pmExcluir
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgRegistrosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'codinterno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Caption = 'Interno'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
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
        Width = 291
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'CM'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fatias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Fatias'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Valor(R$)'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 66
        Visible = True
      end>
  end
  object pnlBtn: TPanel [2]
    Left = 1
    Top = 3
    Width = 97
    Height = 206
    TabOrder = 2
  end
  object btnNovo: TButton [3]
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
    TabOrder = 3
    OnClick = btnNovoClick
  end
  object btnAlterar: TButton [4]
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
    TabOrder = 4
    OnClick = btnAlterarClick
  end
  object btnCancelar: TButton [5]
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
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object btnSalvar: TButton [6]
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
  object pnlPesquisar: TPanel [7]
    Left = 100
    Top = 3
    Width = 485
    Height = 41
    Caption = 'pnlPesquisar'
    TabOrder = 0
    object lblPesq: TLabel
      Left = 28
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
  object edtPesquisar: TEdit [8]
    Left = 198
    Top = 13
    Width = 360
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
  inherited pgcConfiguracao: TPageControl
    Width = 586
    Height = 440
    TabOrder = 9
    inherited tbVendas: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    inherited tab1: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    inherited tab2: TTabSheet
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
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
