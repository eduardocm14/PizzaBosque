inherited frmPesqClientesVendas: TfrmPesqClientesVendas
  ActiveControl = edtPesquisar
  Caption = 'Pesquisa de Clientes'
  ClientWidth = 1004
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  ExplicitWidth = 1010
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPesquisar: TPanel
    Left = 0
    Top = 0
    Width = 1004
    Height = 86
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 36
      Width = 124
      Height = 19
      Caption = 'Nome do Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnLimpar: TButton
      Left = 795
      Top = 19
      Width = 182
      Height = 53
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnLimparClick
    end
    object edtPesquisar: TEdit
      Left = 145
      Top = 33
      Width = 640
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edtPesquisarKeyPress
    end
  end
  object dbgrdClientes: TDBGrid
    Left = 0
    Top = 91
    Width = 1004
    Height = 411
    Hint = 'Bot'#227'o direto para Alterar e Incluir Clientes.'
    Align = alBottom
    DataSource = dmPesqClientesVenda.dsPesqClientesVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgrdClientesDblClick
    OnKeyPress = dbgrdClientesKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Caption = 'Nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Caption = 'Fone'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Caption = 'Celular'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Caption = 'Cidade'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Endere'#231'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 306
        Visible = True
      end>
  end
end
