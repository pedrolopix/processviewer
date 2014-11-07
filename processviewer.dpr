program processviewer;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  uDGProcessList in 'uDGProcessList.pas';

var
  exists: boolean;
  index: integer;
  ProcessList: TDGProcessList;
begin
  { TODO -oUser -cConsole Main : Insert code here }
  //http://www.delphigeist.com/2010/03/process-list.html
  if ParamCount <  1 then
  begin
    ExitCode := 0;
    Exit;
  end;

  ProcessList := TDGProcessList.Create;
  ProcessList.Refresh;
  if FindCmdLineSwitch('r') then
  begin
    exists:= ProcessList.regex(ParamStr(1));
  end else
  begin
    exists:= ProcessList.Exists(ParamStr(1),index);
  end;


  if (exists) then
  begin
    ExitCode := 1;
    WriteLn('found');
  end
  else
  begin
    ExitCode := 0;
    WriteLn('not found');
  end;

  FreeAndNil(ProcessList);
  Exit;
end.
