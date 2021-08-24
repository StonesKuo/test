unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls,DBTables,DB, BaseDm;

type
  TFmQuery2 = class(TForm)
    Button1: TButton;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DataSource: TDataSource;
    procedure Button1Click(Sender: TObject);
  private
    DModule: TBaseDataModule;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmQuery2: TFmQuery2;

implementation

{$R *.DFM}

procedure TFmQuery2.Button1Click(Sender: TObject);
const
  PKG_DataModule = 'TMyDataModule';
  PKG_DataSet = 'Table1';
Var
  AClass:TPersistentClass;
  ADataSet: TDataSet;
begin
  AClass := GetClass(PKG_DataModule);
  if AClass = nil then
    raise Exception.Create('Ãþ§O¥¼µù¥U: ' + PKG_DataModule);

  DModule:= TComponentClass(AClass).Create(Application) as TBaseDataModule;
  ADataSet := DModule.GetDataSet;
  ADataSet.Open;
  DataSource.DataSet := ADataSet;
end;

initialization
  RegisterClass(TFmQuery2);

finalization
  UnRegisterClass(TFmQuery2);

end.
