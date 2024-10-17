object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consultar Detalhes de uma Venda'
  ClientHeight = 693
  ClientWidth = 1204
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 157
    Width = 60
    Height = 16
    Caption = 'Transa'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 327
    Width = 28
    Height = 16
    Caption = 'Itens'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 503
    Width = 80
    Height = 16
    Caption = 'Recebimentos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 751
    Top = 327
    Width = 58
    Height = 16
    Caption = 'Descontos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 376
    Top = 0
    Width = 428
    Height = 151
    Caption = 'Datas'
    TabOrder = 0
    object Label1: TLabel
      Left = 72
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 250
      Top = 24
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object DateTimeInicial: TDateTimePicker
      Left = 72
      Top = 43
      Width = 121
      Height = 21
      Date = 45551.000000000000000000
      Format = 'dd.MM.yyyy'
      Time = 45551.000000000000000000
      TabOrder = 0
    end
    object DateTimeFinal: TDateTimePicker
      Left = 250
      Top = 43
      Width = 127
      Height = 21
      Date = 45551.000000000000000000
      Format = 'dd.MM.yyyy'
      Time = 45551.000000000000000000
      TabOrder = 1
    end
  end
  object DBGridTransacao: TDBGrid
    Left = 8
    Top = 176
    Width = 1178
    Height = 145
    FixedColor = clActiveCaption
    GradientStartColor = clSkyBlue
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentColor = True
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGridTransacaoCellClick
  end
  object DBGridItens: TDBGrid
    Left = 8
    Top = 346
    Width = 737
    Height = 143
    Color = clGradientInactiveCaption
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGridRecebimentos: TDBGrid
    Left = 8
    Top = 522
    Width = 568
    Height = 143
    Color = clGradientInactiveCaption
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BtnConsultar: TButton
    Left = 562
    Top = 132
    Width = 64
    Height = 19
    Caption = '&Consultar'
    TabOrder = 4
    Visible = False
    OnClick = BtnConsultarClick
  end
  object GroupBox2: TGroupBox
    Left = 600
    Top = 514
    Width = 577
    Height = 151
    Caption = 'Totais'
    TabOrder = 5
    object GroupBox3: TGroupBox
      Left = 16
      Top = 19
      Width = 249
      Height = 121
      Caption = 'Venda Selecionada'
      TabOrder = 0
      object LblVendaSelecionada: TLabelEffect
        Left = 16
        Top = 48
        Width = 161
        Height = 49
        GraduateFrom = clWindowText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -35
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 880
    Top = 533
    Width = 281
    Height = 121
    Caption = 'Per'#237'odo Selecionado'
    TabOrder = 6
    object LblPeriodoSelecionado: TLabelEffect
      Left = 24
      Top = 48
      Width = 142
      Height = 33
      GraduateFrom = clWindowText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -35
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox5: TGroupBox
    Left = 17
    Top = 0
    Width = 353
    Height = 151
    Caption = 'Conex'#227'o com o Banco'
    TabOrder = 7
    object Label6: TLabel
      Left = 16
      Top = 32
      Width = 40
      Height = 13
      Caption = 'Servidor'
    end
    object Label7: TLabel
      Left = 184
      Top = 32
      Width = 26
      Height = 13
      Caption = 'Porta'
    end
    object Label8: TLabel
      Left = 16
      Top = 72
      Width = 29
      Height = 13
      Caption = 'Banco'
    end
    object Label9: TLabel
      Left = 16
      Top = 112
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label10: TLabel
      Left = 173
      Top = 112
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object EditServidor: TEdit
      Left = 62
      Top = 29
      Width = 107
      Height = 21
      TabOrder = 0
      Text = 'localhost'
    end
    object EditPorta: TEdit
      Left = 216
      Top = 29
      Width = 106
      Height = 21
      TabOrder = 1
      Text = '3050'
    end
    object EditLocalBanco: TEdit
      Left = 62
      Top = 69
      Width = 179
      Height = 21
      TabOrder = 2
      Text = 'C:\SysPDV\SYSPDV_SRV.FDB'
    end
    object EditUsuarioBanco: TEdit
      Left = 58
      Top = 109
      Width = 95
      Height = 21
      TabOrder = 3
      Text = 'sysdba'
    end
    object EditSenhaBanco: TEdit
      Left = 209
      Top = 109
      Width = 113
      Height = 21
      PasswordChar = '*'
      TabOrder = 4
      Text = 'masterkey'
    end
  end
  object BtnLocalizar: TButton
    Left = 264
    Top = 67
    Width = 75
    Height = 25
    Caption = '&Localizar'
    TabOrder = 8
    OnClick = BtnLocalizarClick
  end
  object JvFooter1: TJvFooter
    Left = 0
    Top = 671
    Width = 1204
    Height = 22
    Align = alBottom
    object Label11: TLabel
      Left = 26
      Top = 0
      Width = 1135
      Height = 13
      Caption = 
        'Informe a conex'#227'o com o banco em seguida o intervalo de datas da' +
        ' consulta e clique em Consultar. Ao selecionar uma linha no grid' +
        ' de Transa'#231#227'o, os detalhes da venda como itens e formas de pagam' +
        'ento ser'#227'o exibidos nos demais grids.'
    end
  end
  object JvXPButtonConsultar: TJvXPButton
    Left = 513
    Top = 89
    Width = 161
    Height = 41
    Caption = 'Consultar'
    TabOrder = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnConsultarClick
  end
  object JvXPButton1: TJvXPButton
    Left = 970
    Top = 157
    Width = 105
    Height = 18
    Caption = 'Consultar Sefaz'
    TabOrder = 11
  end
  object JvXPButton2: TJvXPButton
    Left = 1081
    Top = 157
    Width = 105
    Height = 18
    Caption = 'Reenviar VF'
    TabOrder = 12
  end
  object DBGrid1: TDBGrid
    Left = 751
    Top = 346
    Width = 435
    Height = 143
    TabOrder = 13
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object GroupBox7: TGroupBox
    Left = 810
    Top = 0
    Width = 376
    Height = 151
    Caption = 'WebClient'
    TabOrder = 14
    object Label13: TLabel
      Left = 37
      Top = 67
      Width = 29
      Height = 13
      Caption = 'CNPJ:'
    end
    object Label14: TLabel
      Left = 16
      Top = 45
      Width = 50
      Height = 13
      Caption = 'Cod. Loja:'
    end
    object Label15: TLabel
      Left = 29
      Top = 97
      Width = 37
      Height = 13
      Caption = 'Link VF:'
    end
    object EditCodLoja: TEdit
      Left = 72
      Top = 37
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object EditCNPJ: TEdit
      Left = 72
      Top = 64
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object EditLinkVF: TEdit
      Left = 72
      Top = 94
      Width = 209
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object BtnConfigWebClient: TJvXPButton
      Left = 240
      Top = 24
      Width = 121
      Caption = 'Configurar WebClient'
      TabOrder = 3
      OnClick = BtnConfigWebClientClick
    end
    object BtnAcessarVF: TButton
      Left = 287
      Top = 92
      Width = 75
      Height = 25
      Caption = 'Acessar'
      TabOrder = 4
      OnClick = BtnAcessarVFClick
    end
  end
  object BtnRestartWebClient: TJvXPButton
    Left = 1050
    Top = 51
    Width = 121
    Caption = 'Reiniciar WebClient'
    TabOrder = 15
  end
  object InterBaseUniProvider1: TInterBaseUniProvider
    Left = 392
    Top = 24
  end
  object UniConnection1: TUniConnection
    ProviderName = 'InterBase'
    Left = 392
    Top = 72
  end
  object UniQueryTransacao: TUniQuery
    Connection = UniConnection1
    Left = 216
    Top = 192
  end
  object DataSourceTransacao: TDataSource
    Left = 112
    Top = 184
  end
  object DataSourceItens: TDataSource
    Left = 160
    Top = 376
  end
  object DataSourcePagamentos: TDataSource
    Left = 144
    Top = 544
  end
  object UniQueryItens: TUniQuery
    Connection = UniConnection1
    Left = 248
    Top = 384
  end
  object UniQueryRecebimentos: TUniQuery
    Connection = UniConnection1
    Left = 264
    Top = 544
  end
  object UniQueryTotalSelecionado: TUniQuery
    Connection = UniConnection1
    Left = 776
    Top = 592
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = ''
        FileMask = '*.fdb'
      end
      item
        DisplayName = ''
        FileMask = '*.gdb'
      end>
    Options = []
    OnFileOkClick = FileOpenDialog1FileOkClick
    Left = 176
    Top = 128
  end
  object UniQueryDadosLoja: TUniQuery
    Connection = UniConnection1
    Left = 842
    Top = 128
  end
end
