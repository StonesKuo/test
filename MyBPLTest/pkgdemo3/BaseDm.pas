(*---------------------------------------------------------
  �o�O�@�Ӱ�¦��ƼҲ����O�A�̭��w�q�F�{�����Ҧ���ƼҲ�
  �����Ӧ�����k�A�ҥH�����O���Ҧ���k���ŧi�� abstract.

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
