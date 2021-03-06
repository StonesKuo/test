unit uFormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TMyProc   = Procedure;
  TFormMain = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    fHndl: HModule;
    function CreateFormByClassName(const ClassName: string): integer; //THandle;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.BitBtn1Click(Sender: TObject);
begin
  IF(fHndl <> 0) then
  begin
    unloadpackage(fHndl);
    fHndl := 0;
  end;
end;

procedure TFormMain.BitBtn2Click(Sender: TObject);
begin
  fHndl := LoadPackage('Package1.bpl');

end;

procedure TFormMain.Button1Click(Sender: TObject);
var proc: TMyProc;
begin
  IF(fHndl = 0) then Exit;
  @proc := GetProcAddress(fHndl, 'CreateMyForm');
  if @Proc <> nil then
    Proc;

end;

procedure TFormMain.Button2Click(Sender: TObject);
var proc: TMyProc;
begin
  IF(fHndl = 0) then Exit;
  @proc := GetProcAddress(fHndl, 'FreeMyForm');
  if @Proc <> nil then
    Proc;
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
  CreateFormByClassName('TFormBpl');
end;

function TFormMain.CreateFormByClassName(const ClassName: string): integer;
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
    try
      Result := AForm.ShowModal;
    finally
      FreeAndNil(AForm);
    end;
  end;
end;

end.
