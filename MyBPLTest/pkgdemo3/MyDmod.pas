unit MyDmod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  BaseDm, Db, DBTables;

type
  // �����O���W�٭n�ۦ�קאּ TBaseDataModule
  TMyDataModule = class(TBaseDataModule)
    Database1: TDatabase;
    DataSource1: TDataSource;
    Table1: TTable;
  private
    { Private declarations }
  public
    function GetDataSet: TDataSet; override;
  end;

var
  MyDataModule: TMyDataModule;

implementation

{$R *.DFM}

{ TMyDataModule }

function TMyDataModule.GetDataSet: TDataSet;
begin
  Result := Table1;
end;


initialization
  RegisterClass(TMyDataModule);

finalization
  UnRegisterClass(TMyDataModule);


end.
