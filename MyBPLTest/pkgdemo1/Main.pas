unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMainForm = class(TForm)
    btnLoadPkg1: TButton;
    btnForm1: TButton;
    btnLoadPkg2: TButton;
    btnForm2: TButton;
    ListBox1: TListBox;
    btnUnloadPkg: TButton;
    btnSayHello: TButton;
    btnShowString: TButton;
    procedure btnLoadPkg1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnForm1Click(Sender: TObject);
    procedure btnLoadPkg2Click(Sender: TObject);
    procedure btnForm2Click(Sender: TObject);
    procedure btnUnloadPkgClick(Sender: TObject);
    procedure btnSayHelloClick(Sender: TObject);
    procedure btnShowStringClick(Sender: TObject);
  private
  public
    procedure LoadAddInPackage(PkgName: string);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure UnLoadAddInPackage(Module: THandle);
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
    if (Module = 0) or (HMODULE(M.AllocationBase) = Module) then
      Application.Components[i].Free;
  end;
  UnRegisterModuleClasses(Module);
  UnLoadPackage(Module);
end;

procedure TMainForm.LoadAddInPackage(PkgName: string);
begin
  ListBox1.Items.AddObject(PkgName, Pointer(LoadPackage(PkgName)));
end;

procedure TMainForm.btnLoadPkg1Click(Sender: TObject);
begin
  LoadAddInPackage('Bin\Package1.bpl');
end;

procedure TMainForm.btnLoadPkg2Click(Sender: TObject);
begin
  LoadAddInPackage('Bin\Package2.bpl');
end;

function CreateFormByClassName(const ClassName: string): integer;
var
  AClass: TPersistentClass;
  AForm: TCustomForm;
begin
  Result := mrNone;
  { Note that TApplication "owns" this form and thus it must be freed prior
    to unloading the package }
  AClass := GetClass(ClassName);
  if AClass <> nil then
  begin
    AForm := TComponentClass(AClass).Create(Application) as TCustomForm;
    Result := AForm.ShowModal;
  end;
end;

procedure TMainForm.btnForm1Click(Sender: TObject);
begin
  CreateFormByClassName('TForm1');
end;


procedure TMainForm.btnForm2Click(Sender: TObject);
begin
  CreateFormByClassName('TForm2');
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  for i := 0 to ListBox1.Items.Count-1 do
    UnloadAddinPackage(HMODULE(ListBox1.Items.Objects[i]));
end;

procedure TMainForm.btnUnloadPkgClick(Sender: TObject);
var
  i: integer;
begin
  i := ListBox1.ItemIndex;
  if i < 0 then
    Exit;
  UnloadAddInPackage(HMODULE(ListBox1.Items.Objects[i]));
  ListBox1.Items.Delete(i);
end;

procedure TMainForm.btnSayHelloClick(Sender: TObject);
type
  TSayHelloProc = procedure (msg: string);
var
  i: integer;
  p: TSayHelloProc;
begin
  for i := 0 to ListBox1.Items.Count-1 do
  begin
    p := GetProcAddress(HMODULE(ListBox1.Items.Objects[i]), 'SayHello');
    if @p <> nil then
    begin
      p('Hello, package!');
      break;
    end;
  end;
end;

procedure TMainForm.btnShowStringClick(Sender: TObject);
var
  i: integer;
  pStr: pointer;
begin
  for i := 0 to ListBox1.Items.Count-1 do
  begin
    pStr := GetProcAddress(HMODULE(ListBox1.Items.Objects[i]), 'g_HelloStr');
    if pStr <> nil then
    begin
      ShowMessage('g_HelloStr = ' + string(pStr^));
      break;
    end;
  end;
end;

end.
