object frmConsultaVendas: TfrmConsultaVendas
  Left = 0
  Top = 0
  ActiveControl = dtpDataInicio
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta de Caixas(Vendas)'
  ClientHeight = 676
  ClientWidth = 1129
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1129
    Height = 123
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 201
      Top = 32
      Width = 106
      Height = 14
      Caption = '(Data/Hora) - Inicial'
    end
    object Label2: TLabel
      Left = 483
      Top = 32
      Width = 100
      Height = 14
      Caption = '(Data/Hora) - Final'
    end
    object Label3: TLabel
      Left = 386
      Top = 53
      Width = 9
      Height = 14
      Caption = ' -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rgDataAberFech: TRadioGroup
      Left = 8
      Top = 8
      Width = 675
      Height = 105
      Caption = 'Selecione a data'
      ItemIndex = 0
      Items.Strings = (
        'Abertura'
        'Fechamento')
      TabOrder = 0
    end
    object rgCaixasAbertFech: TRadioGroup
      Left = 713
      Top = 8
      Width = 192
      Height = 105
      Caption = 'Selecione o Caixa'
      ItemIndex = 0
      Items.Strings = (
        'Abertos'
        'Fechados'
        'Todos')
      TabOrder = 5
    end
    object dtpDataInicio: TDateTimePicker
      Left = 120
      Top = 49
      Width = 129
      Height = 22
      Date = 43047.783662395830000000
      Time = 43047.783662395830000000
      TabOrder = 1
    end
    object dtpDataFinal: TDateTimePicker
      Left = 401
      Top = 49
      Width = 129
      Height = 22
      Date = 43047.783677349540000000
      Time = 43047.783677349540000000
      TabOrder = 3
    end
    object dtpHoraInicio: TDateTimePicker
      Left = 255
      Top = 49
      Width = 129
      Height = 22
      Date = 43047.000000000000000000
      Time = 43047.000000000000000000
      Kind = dtkTime
      TabOrder = 2
    end
    object dtpHoraFinal: TDateTimePicker
      Left = 536
      Top = 49
      Width = 129
      Height = 22
      Date = 43047.999988425930000000
      Time = 43047.999988425930000000
      Kind = dtkTime
      TabOrder = 4
    end
    object btnPesquisar: TButton
      Left = 933
      Top = 37
      Width = 160
      Height = 50
      Caption = 'Pesquisar'
      Default = True
      TabOrder = 6
      OnClick = btnPesquisarClick
    end
  end
  object dbgConsultaCaixas: TDBGrid
    Left = 0
    Top = 123
    Width = 1129
    Height = 553
    Align = alClient
    DataSource = dmConsultaFechaCaixas.dsConsultaFechaCaixas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    PopupMenu = pmOpcao
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgConsultaCaixasDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'N'#250'mero'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'caixa_desc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'Caixa(Descri'#231#227'o)'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'user_abert'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'Usu'#225'rio Abert.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_abert'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Valor Abert.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'data_abert'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Data Abert.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'user_fech'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'Usu'#225'rio Fech.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_fech'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Valor Fech.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'data_fech'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Data Fech.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Valor Total'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'abert_fech'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Status'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 50
        Visible = True
      end>
  end
  object pmOpcao: TPopupMenu
    Left = 464
    Top = 272
    object opConsultaVendaspCaixas: TMenuItem
      Caption = 'Consulta vendas por caixa'
      OnClick = opConsultaVendaspCaixasClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object FecharCaixa1: TMenuItem
      Caption = 'Fechar Caixa'
      OnClick = FecharCaixa1Click
    end
  end
end
