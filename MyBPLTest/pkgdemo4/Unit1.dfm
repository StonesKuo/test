object Form1: TForm1
  Left = 354
  Top = 136
  Width = 384
  Height = 372
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 13
    Width = 176
    Height = 29
    Caption = 'Hello, Package1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btnForm2: TButton
    Left = 10
    Top = 65
    Width = 235
    Height = 20
    Caption = 'Load Package2 and show Form2'
    TabOrder = 0
    OnClick = btnForm2Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 96
    Width = 137
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    OnExit = Edit1Exit
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 128
    Width = 320
    Height = 204
    DataSource = DataModule1.DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -10
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnGetField: TButton
    Left = 168
    Top = 96
    Width = 89
    Height = 25
    Caption = 'GetFieldValue'
    TabOrder = 3
    OnClick = btnGetFieldClick
  end
  object btnGetVar: TButton
    Left = 264
    Top = 96
    Width = 75
    Height = 25
    Caption = 'GetVar'
    TabOrder = 4
    OnClick = btnGetVarClick
  end
end
