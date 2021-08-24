object MainForm: TMainForm
  Left = 233
  Top = 198
  Width = 434
  Height = 331
  Caption = 'Package demo for Delphi 5, written by Michael Tsai  2/13/2000'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 24
    Top = 100
    Width = 114
    Height = 16
    Caption = 'Loaded packages:'
  end
  object btnLoadPkg1: TButton
    Left = 24
    Top = 16
    Width = 177
    Height = 25
    Caption = 'Load package 1'
    TabOrder = 0
    OnClick = btnLoadPkg1Click
  end
  object btnForm1: TButton
    Left = 24
    Top = 48
    Width = 177
    Height = 25
    Caption = 'Show Form1'
    TabOrder = 1
    OnClick = btnForm1Click
  end
  object ListBox1: TListBox
    Left = 24
    Top = 124
    Width = 365
    Height = 113
    ImeName = '·sª`­µ'
    ItemHeight = 16
    TabOrder = 2
  end
  object btnUnloadPkg: TButton
    Left = 212
    Top = 244
    Width = 177
    Height = 25
    Caption = 'Unload package'
    TabOrder = 3
    OnClick = btnUnloadPkgClick
  end
  object btnLoadPkg2: TButton
    Left = 212
    Top = 16
    Width = 177
    Height = 25
    Caption = 'Load package 2'
    TabOrder = 4
    OnClick = btnLoadPkg2Click
  end
  object btnForm2: TButton
    Left = 212
    Top = 48
    Width = 177
    Height = 25
    Caption = 'Show Form2'
    TabOrder = 5
    OnClick = btnForm2Click
  end
  object btnUpdatePkgList: TButton
    Left = 24
    Top = 244
    Width = 177
    Height = 25
    Caption = 'Update package list'
    TabOrder = 6
    OnClick = btnUpdatePkgListClick
  end
end
