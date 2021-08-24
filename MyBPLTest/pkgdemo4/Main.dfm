object MainForm: TMainForm
  Left = 233
  Top = 198
  Caption = 'Package demo for Delphi 5, written by Michael Tsai  2/13/2000'
  ClientHeight = 326
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 81
    Width = 89
    Height = 13
    Caption = 'Loaded packages:'
  end
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
  object ListBox1: TListBox
    Left = 20
    Top = 101
    Width = 296
    Height = 92
    ImeName = #26032#27880#38899
    ItemHeight = 13
    TabOrder = 2
  end
  object btnUnloadPkg: TButton
    Left = 172
    Top = 198
    Width = 144
    Height = 21
    Caption = 'Unload package'
    TabOrder = 3
    OnClick = btnUnloadPkgClick
  end
  object btnLoadPkg2: TButton
    Left = 172
    Top = 13
    Width = 144
    Height = 20
    Caption = 'Load package 2'
    TabOrder = 4
    OnClick = btnLoadPkg2Click
  end
  object btnForm2: TButton
    Left = 172
    Top = 39
    Width = 144
    Height = 20
    Caption = 'Show Form2'
    TabOrder = 5
    OnClick = btnForm2Click
  end
  object btnUpdatePkgList: TButton
    Left = 20
    Top = 198
    Width = 143
    Height = 21
    Caption = 'Update package list'
    TabOrder = 6
    OnClick = btnUpdatePkgListClick
  end
end
