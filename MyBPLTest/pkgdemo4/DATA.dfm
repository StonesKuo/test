object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 0
  Width = 0
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'customer.db'
    Left = 24
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 24
    Top = 72
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'vendors.db'
    Left = 88
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 88
    Top = 72
  end
end
