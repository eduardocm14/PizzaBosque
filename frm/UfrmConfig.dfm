object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es'
  ClientHeight = 578
  ClientWidth = 991
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pgcConfiguracao: TPageControl
    Left = 0
    Top = 0
    Width = 991
    Height = 578
    ActivePage = tbVendas
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tbVendas: TTabSheet
      Caption = 'Vendas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object pnlAbaVendas: TPanel
        Left = 0
        Top = 0
        Width = 983
        Height = 547
        Align = alClient
        Color = clMoneyGreen
        ParentBackground = False
        TabOrder = 0
        object dbCbxZerarNumVendas: TDBCheckBox
          Left = 16
          Top = 32
          Width = 313
          Height = 17
          Hint = 
            'Ao selecionar essa op'#231#227'o, a numera'#231#227'o das vendas ser'#225' zerada jun' +
            'to com a abertura di'#225'ria do caixa.'
          Caption = 'Zerar numera'#231#227'o das venda na abertura de caixa.'
          DataField = ' '
          DataSource = dmConfig.dsConfigEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
      end
    end
    object tab1: TTabSheet
      Caption = 'Op'#231#227'o1'
      ImageIndex = 1
    end
    object tab2: TTabSheet
      Caption = 'Op'#231#227'o2'
      ImageIndex = 2
    end
  end
end
