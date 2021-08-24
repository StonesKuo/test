object FormBpl: TFormBpl
  Left = 0
  Top = 0
  Caption = 'FormBpl'
  ClientHeight = 485
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 536
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Database=C:\Program Files\Firebird\Firebird_4_0\firebird.pdb'
      'User_Name=SYSDBA'
      'Password=1688')
    Left = 240
    Top = 64
  end
end
