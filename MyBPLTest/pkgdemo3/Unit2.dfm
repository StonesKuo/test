object FmQuery2: TFmQuery2
  Left = 379
  Top = 132
  Width = 801
  Height = 494
  Caption = 'FmQuery2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 12
    Width = 129
    Height = 25
    Caption = 'Show data'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 60
    Width = 280
    Height = 29
    DataSource = DataSource
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 100
    Width = 521
    Height = 245
    DataSource = DataSource
    ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource: TDataSource
    Left = 152
    Top = 12
  end
end
