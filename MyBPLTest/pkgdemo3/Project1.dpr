program Project1;

uses
  Forms,
  FMain in 'FMain.pas' {FmMain},
  PkgUtils in 'PkgUtils.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmMain, FmMain);
  Application.Run;
end.
