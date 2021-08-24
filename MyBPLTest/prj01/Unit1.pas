unit Unit1;

interface
uses VCL.Forms, System.SysUtils;
procedure CreateMyForm; stdcall;
procedure FreeMyForm; stdcall;
Exports
  CreateMyForm, FreeMyForm;

implementation
uses uFomBpl;
procedure CreateMyForm;
begin
  if not Assigned(FormBpl) then
    FormBpl := TFormBpl.Create(application);
  FormBpl.Show;

end;
procedure FreeMyForm;
begin
  if Assigned(FormBpl) then
    FreeAndNil(FormBpl);
end;

end.
