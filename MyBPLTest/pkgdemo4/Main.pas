unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMainForm = class(TForm)
    btnLoadPkg1: TButton;
    btnForm1: TButton;
    ListBox1: TListBox;
    btnUnloadPkg: TButton;
    Label1: TLabel;
    btnLoadPkg2: TButton;
    btnForm2: TButton;
    btnUpdatePkgList: TButton;
    procedure btnLoadPkg1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnForm1Click(Sender: TObject);
    procedure btnUnloadPkgClick(Sender: TObject);
    procedure btnLoadPkg2Click(Sender: TObject);
    procedure btnForm2Click(Sender: TObject);
    procedure btnUpdatePkgListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses PkgUtils; //data;


procedure TMainForm.btnLoadPkg1Click(Sender: TObject);
begin
  LoadAddinPackage('Package1', 'Package1.bpl');
  btnUpdatePkgList.Click;
end;

procedure TMainForm.btnLoadPkg2Click(Sender: TObject);
begin
  LoadAddinPackage('Package2', 'Package2.bpl');
  btnUpdatePkgList.Click;
end;

procedure TMainForm.btnForm1Click(Sender: TObject);
begin
  ShowModalFormByClassName('TForm1');
end;

procedure TMainForm.btnForm2Click(Sender: TObject);
begin
  ShowModalFormByClassName('TForm2');
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  UnloadAddins;
end;

procedure TMainForm.btnUnloadPkgClick(Sender: TObject);
var
  i: integer;
begin
  i := ListBox1.ItemIndex;
  if i < 0 then
    Exit;
  UnloadAddinPackage(ListBox1.Items.Strings[i]);
  ListBox1.Items.Delete(i);
end;

procedure TMainForm.btnUpdatePkgListClick(Sender: TObject);
begin
  ListBox1.Items.Assign(GetAddinPackages);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  //Application.CreateForm(TDataModule1, DataModule1);
end;

end.
