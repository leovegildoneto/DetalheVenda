object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consultar Detalhes de uma Venda'
  ClientHeight = 680
  ClientWidth = 1204
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 157
    Width = 50
    Height = 13
    Caption = 'Transa'#231#227'o'
  end
  object Label4: TLabel
    Left = 8
    Top = 327
    Width = 25
    Height = 13
    Caption = 'Itens'
  end
  object Label5: TLabel
    Left = 8
    Top = 503
    Width = 67
    Height = 13
    Caption = 'Recebimentos'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 1178
    Height = 105
    Caption = 'Datas'
    TabOrder = 0
    object Label1: TLabel
      Left = 400
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 610
      Top = 24
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object DateTimeInicial: TDateTimePicker
      Left = 400
      Top = 43
      Width = 121
      Height = 21
      Date = 45551.000000000000000000
      Format = 'dd.MM.yyyy'
      Time = 45551.000000000000000000
      TabOrder = 0
    end
    object DateTimeFinal: TDateTimePicker
      Left = 610
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
    Width = 1178
    Height = 143
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
    Left = 488
    Top = 111
    Width = 217
    Height = 34
    Caption = 'Consultar'
    TabOrder = 4
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
  object InterBaseUniProvider1: TInterBaseUniProvider
    Left = 896
    Top = 8
  end
  object UniConnection1: TUniConnection
    ProviderName = 'InterBase'
    Left = 896
    Top = 56
  end
  object UniQueryTransacao: TUniQuery
    Connection = UniConnection1
    Left = 1120
    Top = 104
  end
  object DataSourceTransacao: TDataSource
    Left = 1008
    Top = 104
  end
  object DataSourceItens: TDataSource
    Left = 1008
    Top = 56
  end
  object DataSourcePagamentos: TDataSource
    Left = 1008
    Top = 8
  end
  object UniQueryItens: TUniQuery
    Connection = UniConnection1
    Left = 1120
    Top = 56
  end
  object UniQueryRecebimentos: TUniQuery
    Connection = UniConnection1
    Left = 1120
    Top = 8
  end
  object UniQueryTotalSelecionado: TUniQuery
    Connection = UniConnection1
    Left = 896
    Top = 112
  end
end
