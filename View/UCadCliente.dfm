object frmCadCliente: TfrmCadCliente
  Left = 530
  Top = 214
  Caption = 'Cadastrar Cliente'
  ClientHeight = 459
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 418
    Width = 850
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnFechar: TButton
      Left = 743
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 850
    Height = 418
    ActivePage = tsPesq
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 256
    ExplicitTop = 115
    ExplicitWidth = 289
    ExplicitHeight = 193
    object tsPesq: TTabSheet
      Caption = 'tsPesq'
      object pnlCabecalho: TPanel
        Left = 0
        Top = 0
        Width = 842
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        Color = clGrayText
        ParentBackground = False
        TabOrder = 0
        object lbledtPesquisar: TLabeledEdit
          Left = 17
          Top = 28
          Width = 328
          Height = 21
          EditLabel.Width = 101
          EditLabel.Height = 13
          EditLabel.Caption = 'Digite para pesquisar'
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 708
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object pnlbotoes: TPanel
        Left = 0
        Top = 330
        Width = 842
        Height = 60
        Align = alBottom
        BevelOuter = bvNone
        Color = clGrayText
        ParentBackground = False
        TabOrder = 2
        object btnNovo: TButton
          Left = 577
          Top = 17
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnDetalhar: TButton
          Left = 658
          Top = 17
          Width = 75
          Height = 25
          Caption = 'Detalhar'
          TabOrder = 1
          OnClick = btnDetalharClick
        end
        object btnExcluir: TButton
          Left = 739
          Top = 17
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object dbgrdCliente: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 75
        Width = 836
        Height = 252
        Align = alClient
        DataSource = dsPesq
        DrawingStyle = gdsGradient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgrdClienteDblClick
      end
    end
    object tsDados: TTabSheet
      Caption = 'tsDados'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblTipo: TLabel
        Left = 32
        Top = 139
        Width = 20
        Height = 13
        Caption = 'Tipo'
      end
      object lbledtCodigo: TLabeledEdit
        Left = 30
        Top = 51
        Width = 106
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        TabOrder = 0
      end
      object lbledtNome: TLabeledEdit
        Left = 30
        Top = 104
        Width = 307
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        TabOrder = 1
      end
      object lbledtDocumento: TLabeledEdit
        Left = 216
        Top = 154
        Width = 121
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Documento'
        MaxLength = 15
        TabOrder = 3
      end
      object lbledtTelefone: TLabeledEdit
        Left = 386
        Top = 154
        Width = 121
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'Telefone'
        MaxLength = 10
        TabOrder = 4
      end
      object cbbTipo: TComboBox
        Left = 34
        Top = 154
        Width = 145
        Height = 21
        ItemIndex = 0
        TabOrder = 2
        Text = 'F'#237'sico'
        Items.Strings = (
          'F'#237'sico'
          'Juridico')
      end
      object pnlBotoesCadCli: TPanel
        Left = 0
        Top = 331
        Width = 842
        Height = 59
        Align = alBottom
        BevelOuter = bvNone
        Color = clGrayText
        ParentBackground = False
        TabOrder = 5
        object btnAlterar: TButton
          Left = 580
          Top = 19
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnListar: TButton
          Left = 499
          Top = 19
          Width = 75
          Height = 25
          Caption = 'Listar'
          TabOrder = 0
          OnClick = btnListarClick
        end
        object btnGravar: TButton
          Left = 661
          Top = 19
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 2
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 739
          Top = 19
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 3
          OnClick = btnCancelarClick
        end
      end
    end
  end
  object dsPesq: TDataSource
    DataSet = DMCliente.cdsPesquisar
    Left = 716
    Top = 203
  end
end
