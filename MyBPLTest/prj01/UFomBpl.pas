unit UFomBpl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type
  TFormBpl = class(TForm)
    Button1: TButton;
    FDConnection1: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBpl: TFormBpl;

implementation

{$R *.dfm}

procedure CreateForm;
begin
  FormBpl := TFormBpl.Create(application);
  FormBpl.Show;
end;
procedure DestroyForm;
begin
  if Assigned(FormBpl) then
    FormBpl.Destroy;
end;

Initialization
  RegisterClass(TFormBpl);
{Finalization
  DestroyForm;    }
end.
