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
  Windows, SysUtils, Classes, Forms, Controls, DB;

{ Package }
function GetAddinPackages: TStrings;
function LoadAddinPackage(const PackageID, FileName: string): HMODULE;
procedure UnloadAddinPackage(ModuleInstance: HMODULE); overload;
procedure UnloadAddinPackage(const PackageID: string); overload;
procedure UnloadAddins;

{ Form }
function CreateFormByClassName(const ClassName: string): TCustomForm;
function ShowModalFormByClassName(const ClassName: string): integer;

implementation

var
  AddinPackages: TStrings;

resourcestring
  sErrorCreateForm = '無法建立視窗!'#13#10'類別 %s 尚未註冊';

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
