unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    btnForm2: TButton;
    procedure btnForm2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses PkgUtils;

{ The following call Registers the addin with the application.  Once
  this occurs the application can create instances of this form. }
procedure TForm1.btnForm2Click(Sender: TObject);
begin
  inherited;
  LoadAddinPackage('Package2', 'Package2.bpl');
  ShowModalFormByClassName('TForm2');
end;

initialization
  RegisterClass(TForm1);

end.
