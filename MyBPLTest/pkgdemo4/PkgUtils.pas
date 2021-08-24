(*----------------------------------------------------------------------------
  DESCRIPTION

    動態載入及釋放外加模組(addin packages)的工具函式。

  NOTE

  HISTORY

    Mar-03-2000 Initial version.

  Written by Michael Tsai.
----------------------------------------------------------------------------*)
unit PkgUtils;

interface

uses
  Windows, SysUtils, Classes, Forms, Controls, Db, DBTables;

type
  // STOCK 資料結構
  TCAR_Field = record
    STKNO: String;
    CARPH: String;      // 選擇的車種簡碼
    CARNAME: String;    // 選擇的車種(中文)名稱
    CARNAME_E: String;  // 選擇的車種(英文)名稱
    CARYEAR: String;    // 年份
    CC: String;         // CC 數
  end;

{ Package }
  function GetAddinPackages: TStrings;
  function LoadAddinPackage(const PackageID, FileName: string): HMODULE;
  procedure UnloadAddinPackage(ModuleInstance: HMODULE); overload;
  procedure UnloadAddinPackage(const PackageID: string); overload;
  procedure UnloadAddins;

{ Form }
  function FindTable(const TableName: string): TTable;
  procedure CreateDataModule(dm: TComponentClass; var dmVar);
  function CreateDataModuleByClassName(const ClassName: string): TDataModule;
  function CreateFormByClassName(const ClassName: string): TCustomForm;
  function ShowModalFormByClassName(const ClassName: string): integer;

var
  COMPANY_NO: String;

implementation

var
  AddinPackages: TStrings;

resourcestring
  sErrorCreateForm = '無法建立視窗!'#13#10'類別 %s 尚未註冊';

function FindTable(const TableName: string): TTable;
var i, j: Integer;
    A: TDataModule;
begin
  Result := nil;
  for i := 0 to Application.ComponentCount -1 do
  begin
    if Application.Components[i] is TDataModule then
    begin
      A := Application.Components[i] as TDataModule;
      for j := 0 to A.ComponentCount -1 do
      begin
        if A.Components[j].Name = TableName then
        begin
          Result := A.Components[j] as TTable;
          Break;
        end;
      end;
      Break;
    end;
  end;
end;

procedure CreateDataModule(dm: TComponentClass; var dmVar);
begin
  Application.CreateForm(dm, dmVar);

end;

function CreateDataModuleByClassName(const ClassName: string): TDataModule;
var dmTemp: TDataModule;
    AClass: TPersistentClass;
begin
  Result := nil;
  AClass := GetClass(ClassName);
  if (AClass <> nil) then
  begin
    dmTemp := TComponentClass(AClass).Create(Application) as TDataModule;

//    dmTemp.Name := 'DataModule1';
    Result := dmTemp;
  end;
end;

function GetAddinPackages: TStrings;
begin
  Result := AddinPackages;
end;

function LoadAddinPackage(const PackageID, FileName: string): HMODULE;
var
  ModuleInstance: HMODULE;
begin
  { 檢查package是否已經載入以避免重複載入，重複載入模組只會遞增參考計數 }
  ModuleInstance := GetModuleHandle(PChar(ExtractFileName(FileName)));
  if ModuleInstance = 0 then
  begin
    ModuleInstance := LoadPackage(FileName);
    { 已經存在的 package 不要重複加入串列中 }
    if AddinPackages.IndexOfObject(Pointer(ModuleInstance)) < 0 then
      AddinPackages.AddObject(UpperCase(PackageID), Pointer(ModuleInstance));
  end;
  Result := ModuleInstance;
end;

procedure UnloadAddInPackage(ModuleInstance: HMODULE);
var
  i: Integer;
  M: TMemoryBasicInformation;
begin
  { Make sure there aren't any instances of any of the classes from Module
    instantiated, if so then free them.  (this assumes that the classes are
    owned by the application) }
  for i := Application.ComponentCount - 1 downto 0 do
  begin
    VirtualQuery(GetClass(Application.Components[i].ClassName), M, SizeOf(M));
    if (ModuleInstance = 0) or (HMODULE(M.AllocationBase) = ModuleInstance) then
      Application.Components[i].Free;
  end;
  UnRegisterModuleClasses(ModuleInstance);
  UnloadPackage(ModuleInstance);
end;

procedure UnloadAddinPackage(const PackageID: string);
var
  i: integer;
begin
  i := AddinPackages.IndexOf(UpperCase(PackageID));
  if i < 0 then
    Exit;

  UnloadAddinPackage(HMODULE(AddinPackages.Objects[i]));

  { Maintain loaded package list }
   AddinPackages.Delete(i);
end;

procedure UnloadAddins;
var
  i: integer;
begin
  for i := 0 to AddinPackages.Count-1 do
    UnloadAddinPackage(HMODULE(AddinPackages.Objects[i]));
  AddinPackages.Clear;
end;

function CreateFormByClassName(const ClassName: string): TCustomForm;
var
  AClass: TPersistentClass;
begin
  { Note that TApplication "owns" this form and thus it must be freed prior
    to unloading the package }
  AClass := GetClass(ClassName);
  if AClass <> nil then
    Result := TComponentClass(AClass).Create(Application) as TCustomForm
  else
    raise Exception.CreateFmt(sErrorCreateForm, [ClassName]);
end;

function ShowModalFormByClassName(const ClassName: string): integer;
var
  frm: TCustomForm;
begin
  frm := CreateFormByClassName(ClassName);
  try
    Result := frm.ShowModal;
  finally
    frm.Release;
  end;
end;

//-----------------------------------------------------------------------------

initialization
  AddinPackages := TStringList.Create;

finalization
  AddinPackages.Free;

end.
