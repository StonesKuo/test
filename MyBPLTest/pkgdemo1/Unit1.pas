unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  g_HelloStr: string = 'Hello, I am Michael!';

procedure SayHello(msg: string);

exports
 SayHello,
 g_HelloStr;

implementation

{$R *.DFM}

procedure SayHello(msg: string);
begin
  ShowMessage(msg);
end;

{ The following call Registers the addin with the application.  Once
  this occurs the application can create instances of this form. }
initialization
  RegisterClass(TForm1);

end.
