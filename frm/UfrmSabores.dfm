inherited frmSabores: TfrmSabores
  ActiveControl = edtPesquisar
  BorderIcons = [biSystemMenu]
  Caption = 'Sabores'
  ClientHeight = 440
  ClientWidth = 586
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 592
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCadastros: TPanel
    Left = 100
    Top = 45
    Width = 485
    Height = 164
    TabOrder = 6
    object lbl1: TLabel
      Left = 6
      Top = 57
      Width = 175
      Height = 14
      Caption = 'Sabores de Pizzas(Descri'#231#227'o)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbedtNome: TDBEdit
      Left = 6
      Top = 73
      Width = 467
      Height = 22
      DataField = 'descricao'
      DataSource = dmSabores.dsSabores
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbrgEspecial: TDBRadioGroup
      Left = 328
      Top = 9
      Width = 145
      Height = 52
      Hint = 'Marcar "Sim" para sabores com valores diferenciados.'
      Caption = 'Sabor Especial'
      Columns = 2
      DataField = 'especial'
      DataSource = dmSabores.dsSabores
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Items.Strings = (
        'N'#227'o'
        'Sim')
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Values.Strings = (
        'N'
        'S')
    end
  end
  object dbgRegistros: TDBGrid
    Left = 1
    Top = 211
    Width = 584
    Height = 227
    DataSource = dmSabores.dsSabores
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'id'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 52
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
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 404
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'esptipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Especial'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold, fsItalic]
        Width = 74
        Visible = True
      end>
  end
  object pnlBtn: TPanel
    Left = 1
    Top = 3
    Width = 97
    Height = 206
    TabOrder = 2
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
    TabOrder = 3
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
    TabOrder = 4
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
    TabOrder = 5
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
  object edtPesquisar: TEdit
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
  object pmExcluir: TPopupMenu
    Left = 144
    Top = 368
    object Exluir1: TMenuItem
      Caption = 'Exluir'
    end
  end
end
