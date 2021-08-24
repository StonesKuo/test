unit DATA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDataModule1 = class(TDataModule)
    Table1: TTable;
    DataSource1: TDataSource;
    Table2: TTable;
    DataSource2: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    COMPANY_NAME: String;
  end;

var
  DataModule1: TDataModule1;

implementation

uses PkgUtils;

{$R *.DFM}

initialization
  RegisterClass(TDataModule1);

finalization
  UnregisterClass(TDataModule1);

end.
