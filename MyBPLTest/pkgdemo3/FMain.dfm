object FmMain: TFmMain
  Left = 262
  Top = 182
  Width = 461
  Height = 280
  Caption = 'FmMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 28
    Top = 12
    Width = 173
    Height = 25
    Caption = 'Load DataModule package'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 28
    Top = 52
    Width = 173
    Height = 25
    Caption = 'Show data form'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object ListBox1: TListBox
    Left = 224
    Top = 8
    Width = 189
    Height = 201
    ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
    ItemHeight = 13
    TabOrder = 2
  end
end
