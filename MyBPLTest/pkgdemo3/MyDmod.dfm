inherited MyDataModule: TMyDataModule
  OldCreateOrder = True
  Left = 397
  Top = 154
  Height = 271
  Width = 549
  object Database1: TDatabase
    AliasName = 'DBDEMOS'
    Connected = True
    DatabaseName = 'test1'
    HandleShared = True
    LoginPrompt = False
    SessionName = 'Default'
    Left = 24
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 24
    Top = 132
  end
  object Table1: TTable
    DatabaseName = 'test1'
    TableName = 'customer.db'
    Left = 20
    Top = 76
  end
end
