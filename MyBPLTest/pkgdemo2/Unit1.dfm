object Form1: TForm1
  Left = 354
  Top = 136
  Width = 384
  Height = 160
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 216
    Height = 36
    Caption = 'Hello, Package1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -30
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btnForm2: TButton
    Left = 12
    Top = 80
    Width = 289
    Height = 25
    Caption = 'Load Package2 and show Form2'
    TabOrder = 0
    OnClick = btnForm2Click
  end
end
