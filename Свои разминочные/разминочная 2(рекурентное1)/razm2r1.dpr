Program razm2r1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var
  Kr0, Kr1, Z0, Z1, i, takt, errors: integer;
  vvod:string;
  check:boolean;


Begin
  repeat
    Writeln('�������, ����������, ���������� ������� ��������');
    Readln(vvod);
    val(vvod,Kr0,errors);
    if (errors>0) or (Kr0<0) then
    Writeln('������� �������� ������');
  until(errors=0) and (Kr0>0);

  repeat
    Writeln('�������, ����������, ���������� ������');
    Readln(vvod);
    val(vvod,takt,errors);
    if (errors>0) or (takt<0) then
    Writeln('������� �������� ������');
  until(errors=0) and (takt>=0);
  Z0 := 0;
  Kr1 := Kr0;
  Z1 := Z0;
  check:=false;
  Writeln('_____________________________________________________________');
  Writeln('|  Tact  |   Red back-a   |   Green back-a   |     Total     |');
  Writeln('|________|________________|__________________|_______________|');
  for i := 1 to takt do
  begin
    if abs(Z1)+abs(Kr1)=Z1+Kr1 then
    begin
      Z1 := Z0 + Kr0;
      Kr1 := Z0;
      Kr0 := Kr1;
      Z0 := Z1;
      if check=false then
      begin

        Writeln('|',i:8,'|',Kr1:16,'|',Z1:18,'|',(Z1+Kr1):15,'|');
        Writeln('|________|________________|__________________|_______________|');

      end;
    end
    else
     check:=true;
  end;
  Readln;
  Readln;

End.
