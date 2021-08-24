unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, PkgUtils, Grids, DBGrids;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses DATA;

{$R *.DFM}

procedure TForm2.Button1Click(Sender: TObject);
begin
  COMPANY_NO := Edit1.Text;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  Edit1.Text := COMPANY_NO;
end;

initialization
//  ShowMessage('Register class: TForm2');
  RegisterClass(TForm2);

end.
