object MainForm: TMainForm
  Left = 262
  Top = 109
  Width = 462
  Height = 320
  Caption = 'Package demo for Delphi 5, written by Michael Tsai  2/13/2000'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object btnLoadPkg1: TButton
    Left = 20
    Top = 13
    Width = 143
    Height = 20
    Caption = 'Load package 1'
    TabOrder = 0
    OnClick = btnLoadPkg1Click
  end
  object btnForm1: TButton
    Left = 20
    Top = 39
    Width = 143
    Height = 20
    Caption = 'Show Form1'
    TabOrder = 1
    OnClick = btnForm1Click
  end
  object btnLoadPkg2: TButton
    Left = 179
    Top = 13
    Width = 144
    Height = 20
    Caption = 'Load package 2'
    TabOrder = 2
    OnClick = btnLoadPkg2Click
  end
  object btnForm2: TButton
    Left = 179
    Top = 39
    Width = 144
    Height = 20
    Caption = 'Show Form2'
    TabOrder = 3
    OnClick = btnForm2Click
  end
  object ListBox1: TListBox
    Left = 20
    Top = 120
    Width = 293
    Height = 66
    ImeName = #26032#27880#38899
    ItemHeight = 13
    TabOrder = 4
  end
  object btnUnloadPkg: TButton
    Left = 20
    Top = 198
    Width = 296
    Height = 21
    Caption = 'Unload package'
    TabOrder = 5
    OnClick = btnUnloadPkgClick
  end
  object btnSayHello: TButton
    Left = 20
    Top = 65
    Width = 143
    Height = 20
    Caption = 'Call '#39'SayHello'#39
    TabOrder = 6
    OnClick = btnSayHelloClick
  end
  object btnShowString: TButton
    Left = 20
    Top = 91
    Width = 143
    Height = 20
    Caption = 'Show '#39'g_HelloStr'#39
    TabOrder = 7
    OnClick = btnShowStringClick
  end
end
