Program razm2r2v1;
{ The program calculates the number of bacteria of each species
  for the entered number of red bacteria and the entered number of ticks }

{$APPTYPE CONSOLE} // Console app

// Modules declaration
uses
  System.SysUtils;

// Variables declaration
var
  Kr0, Kr1, Z0, Z1, Kr2, Z2, i, takt, errors: integer;
  vvod: string;
  check: boolean;
  { Kr0, Kr1, Z0, Z1, Kr2, Z2- the number of bacteria in certain steps;
    i - current measure counter;
    takt - total ticks;
    errors - the number of errors for val procedure;
    vvod - string variable to check;
    check - boolean variable to check }

Begin
  // �hecking for the injected amount of red bacteria
  repeat
    Writeln('�������, ����������, ���������� ������� ��������');
    Readln(vvod);
    val(vvod, Kr0, errors);
    if (errors > 0) or (Kr0 < 0) then
      Writeln('������� �������� ������');
  until (errors = 0) and (Kr0 > 0);
  // �hecking for the injected amount of ticks
  repeat
    Writeln('�������, ����������, ���������� ������');
    Readln(vvod);
    val(vvod, takt, errors);
    if (errors > 0) or (takt < 0) then
      Writeln('������� �������� ������');
  until (errors = 0) and (takt >= 0);

  Z0 := 0;
  Kr2 := Z0;
  Z2 := Kr0;
  Z1 := Kr0;
  Kr1 := Z0;
  check := false;
  // Output of the beginning of the table
  Writeln('_____________________________________________________________');
  Writeln('|  Tact  |   Red back-a   |   Green back-a   |     Total     |');
  Writeln('|________|________________|__________________|_______________|');
  for i := 1 to takt do
  begin
    // Overflow check 1 to start the cycle
    if abs(Z1) + abs(Kr1) = Z1 + Kr1 then
    begin
      // Overflow check 2 for output values
      if (Z1 + Kr1 >= 0) and (Z1 >= 0) and (Kr1 >= 0) then
      begin
        Writeln('|', i:8, '|', Kr1:16, '|', Z1:18, '|', (Z1 + Kr1):15, '|');
        Writeln('|________|________________|__________________|_______________|');
      end;
      // Recurrence relation
      Z1 := Z0 + Z2;
      Kr1 := Kr0 + Kr2;
      Kr0 := Kr2;
      Z0 := Z2;
      Kr2 := Kr1;
      Z2 := Z1;

    end
    else
      check := true;
  end;
  if check then
    Writeln('����� �� ������� ����������');
  Readln;

End.
