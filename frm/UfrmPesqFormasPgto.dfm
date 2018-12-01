object frmPesqFormasPgto: TfrmPesqFormasPgto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisa de Formas de Pagamento'
  ClientHeight = 520
  ClientWidth = 969
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpPesquisar: TGroupBox
    Left = 1
    Top = 1
    Width = 704
    Height = 513
    Caption = 'Informe a forma de pagamento para pesquisar  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 2
    object gbxSelGeral: TGroupBox
      Left = 39
      Top = 309
      Width = 625
      Height = 90
      TabOrder = 0
      object grpValorPago: TGroupBox
        Left = 366
        Top = 6
        Width = 125
        Height = 52
        Caption = 'Valor Pagar(R$)'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object edtValorPago: TEdit
          Left = 12
          Top = 20
          Width = 102
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnChange = edtValorPagoChange
          OnKeyPress = edtValorPagoKeyPress
        end
      end
      object gbxSelFormaPagto: TGroupBox
        Left = 9
        Top = 6
        Width = 352
        Height = 52
        Caption = 'Forma de Pagamento Selecionada '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
        TabOrder = 0
        object edtFormaPagtoCod: TEdit
          Left = 6
          Top = 20
          Width = 53
          Height = 24
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 0
        end
        object edtFormaPagtoDesc: TEdit
          Left = 62
          Top = 20
          Width = 283
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
          TabOrder = 1
        end
      end
      object grpValorTotal: TGroupBox
        Left = 493
        Top = 6
        Width = 125
        Height = 52
        Caption = 'Valor Total(R$)'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object edtValorTotal: TEdit
          Left = 12
          Top = 20
          Width = 102
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnChange = edtValorPagoChange
          OnKeyPress = edtValorPagoKeyPress
        end
      end
      object btnIncluirPagto: TButton
        Left = 507
        Top = 61
        Width = 102
        Height = 26
        Hint = 'Incluir a forma de pagamento selecionada'
        Caption = 'Incluir(+)'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnIncluirPagtoClick
      end
    end
    object btnConfirma: TButton
      Left = 554
      Top = 455
      Width = 110
      Height = 50
      Hint = 'Incluir forma de pagamento a venda.'
      Caption = 'Confirmar - F4'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnConfirmaClick
    end
    object dbgFormasPgtoSelecionados: TDBGrid
      Left = 39
      Top = 404
      Width = 512
      Height = 101
      DataSource = dsFormaPgto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = pmExcluir
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsItalic]
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'codformapagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Caption = 'Forma de Pagamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 265
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 71
          Visible = True
        end>
    end
    object btnCancelar: TButton
      Left = 554
      Top = 404
      Width = 110
      Height = 50
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 3
      OnClick = btnCancelarClick
    end
  end
  object pnlPesquisar: TPanel
    Left = 40
    Top = 30
    Width = 625
    Height = 41
    TabOrder = 0
    object edtPesquisar: TEdit
      Left = 9
      Top = 11
      Width = 502
      Height = 22
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edtPesquisarKeyPress
    end
    object btnLimpaPesq: TButton
      Left = 516
      Top = 9
      Width = 102
      Height = 26
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnLimpaPesqClick
    end
  end
  object dbgPesqRegistros: TDBGrid
    Left = 40
    Top = 75
    Width = 625
    Height = 231
    DataSource = dmFormaPgto.dsFormaPgto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgPesqRegistrosDblClick
    OnKeyPress = dbgPesqRegistrosKeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Forma de Pagamento'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 438
        Visible = True
      end>
  end
  object gbxValorPago: TGroupBox
    Left = 717
    Top = 1
    Width = 241
    Height = 513
    Caption = 'Teclado Virtual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object btnSete: TBitBtn
      Left = 10
      Top = 36
      Width = 70
      Height = 110
      Caption = '7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TabStop = False
      OnClick = btnSeteClick
    end
    object btnOito: TBitBtn
      Left = 86
      Top = 36
      Width = 70
      Height = 110
      Caption = '8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnClick = btnOitoClick
    end
    object btnNove: TBitBtn
      Left = 162
      Top = 34
      Width = 70
      Height = 110
      Caption = '9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnClick = btnNoveClick
    end
    object btnQuatro: TBitBtn
      Left = 10
      Top = 150
      Width = 70
      Height = 110
      Caption = '4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      TabStop = False
      OnClick = btnQuatroClick
    end
    object btnCinco: TBitBtn
      Left = 86
      Top = 150
      Width = 70
      Height = 110
      Caption = '5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      TabStop = False
      OnClick = btnCincoClick
    end
    object btnSeis: TBitBtn
      Left = 162
      Top = 150
      Width = 70
      Height = 110
      Caption = '6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = False
      OnClick = btnSeisClick
    end
    object btnTres: TBitBtn
      Left = 162
      Top = 264
      Width = 70
      Height = 110
      Caption = '3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      TabStop = False
      OnClick = btnTresClick
    end
    object btnDois: TBitBtn
      Left = 86
      Top = 264
      Width = 70
      Height = 110
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      TabStop = False
      OnClick = btnDoisClick
    end
    object btnUm: TBitBtn
      Left = 10
      Top = 264
      Width = 70
      Height = 110
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      TabStop = False
      OnClick = btnUmClick
    end
    object btnLimpar: TBitBtn
      Left = 10
      Top = 379
      Width = 70
      Height = 110
      Caption = 'Limpa'
      TabOrder = 11
      TabStop = False
      OnClick = btnLimparClick
    end
    object btnZero: TBitBtn
      Left = 86
      Top = 379
      Width = 70
      Height = 110
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      TabStop = False
      OnClick = btnZeroClick
    end
    object btnVirgula: TBitBtn
      Left = 162
      Top = 379
      Width = 70
      Height = 110
      Caption = ','
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      TabStop = False
      OnClick = btnVirgulaClick
    end
  end
  object cdsFormaPgto: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 238
    Top = 449
    object cdsFormaPgtocodformapagto: TIntegerField
      FieldName = 'codformapagto'
    end
    object cdsFormaPgtodescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
    object cdsFormaPgtovalor: TCurrencyField
      FieldName = 'valor'
      DisplayFormat = '#,##0.00'
    end
    object cdsFormaPgtovl_total: TAggregateField
      FieldName = 'vl_total'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(valor)'
    end
  end
  object dsFormaPgto: TDataSource
    DataSet = cdsFormaPgto
    Left = 350
    Top = 448
  end
  object pmExcluir: TPopupMenu
    Left = 120
    Top = 448
    object Exluir1: TMenuItem
      Caption = 'Excluir Forma de Pagamento'
      OnClick = Exluir1Click
    end
  end
end
