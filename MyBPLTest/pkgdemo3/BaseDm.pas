(*---------------------------------------------------------
  這是一個基礎資料模組類別，裡面定義了程式中所有資料模組
  都應該有的方法，所以此類別的所有方法都宣告為 abstract.

  Written by Michael Tsai, Aug-11-2000.
---------------------------------------------------------*)
unit BaseDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, Dialogs, DB;

type
  TBaseDataModule = class(TDataModule)
  private
    { Private declarations }
  public
    function GetDataSet: TDataSet; virtual; abstract;
  end;


//var
//  BaseDataModule: TBaseDataModule;

implementation

{$R *.DFM}

end.
