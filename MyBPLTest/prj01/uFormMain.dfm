object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 382
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 160
    Top = 32
    Width = 75
    Height = 25
    Caption = 'unload'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 56
    Top = 32
    Width = 75
    Height = 25
    Caption = 'load'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object Button1: TButton
    Left = 72
    Top = 88
    Width = 75
    Height = 25
    Caption = 'crtform'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 88
    Width = 75
    Height = 25
    Caption = 'freeform'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 72
    Top = 136
    Width = 75
    Height = 25
    Caption = 'by formclass'
    TabOrder = 4
    OnClick = Button3Click
  end
end
