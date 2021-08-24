unit FMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFmMain = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ListBox1: TListBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmMain: TFmMain;

implementation

uses PkgUtils;

{$R *.DFM}

procedure TFmMain.BitBtn1Click(Sender: TObject);
begin
  LoadAddinPackage('DModule2', 'DModule2.bpl');
  ListBox1.Items.Assign(GetAddinPackages);
end;

procedure TFmMain.BitBtn2Click(Sender: TObject);
begin
  LoadAddinPackage('Query2','QUERY2.BPL');
  ListBox1.Items.Assign(GetAddinPackages);
  ShowModalFormByClassName('TFmQuery2');
end;

procedure TFmMain.FormDestroy(Sender: TObject);
begin
 UnloadAddins;
end;

end.
