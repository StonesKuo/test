unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, DBTables;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    btnForm2: TButton;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    btnGetField: TButton;
    btnGetVar: TButton;
    procedure btnForm2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnGetFieldClick(Sender: TObject);
    procedure btnGetVarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses PkgUtils, DATA;

{$R *.DFM}

{ The following call Registers the addin with the application.  Once
  this occurs the application can create instances of this form. }
procedure TForm1.btnForm2Click(Sender: TObject);
begin
  inherited;
  LoadAddinPackage('Package2', 'Package2.bpl');
  ShowModalFormByClassName('TForm2');
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  COMPANY_NO := Edit1.Text;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Edit1.Text := COMPANY_NO;
end;

procedure TForm1.btnGetFieldClick(Sender: TObject);
var A: TTable;
begin
//  以下這二行是用間接參考方式對TDataModule1處理, 比較麻煩
//  A := FindTable('Table1');
//  Edit1.Text := A.FieldByName('CustNo').AsString;

// 對TDataModule1處理
  Edit1.Text := DataModule1.Table1.FieldByName('CustNo').AsString;
end;

procedure TForm1.btnGetVarClick(Sender: TObject);
begin
  DataModule1.COMPANY_NAME := Edit1.Text;
end;

initialization
  RegisterClass(TForm1);

end.
