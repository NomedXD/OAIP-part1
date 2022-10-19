Program razm2bezR;
{ The program calculates the number of bacteria of each species
for the entered number of red bacteria and the entered
number of ticks }

{$APPTYPE CONSOLE} // Console application

// Modules declaration
uses
  System.SysUtils;

Var
  RedB, GreenB, k, i, Tacts, errors: integer;
  Proverka:string;
  { RedB - red bacteria count;
    GreenB - green bacteria count;
    Tacts - number of ticks;
    Proverka - checker for input data;
    errors - number of errors while checking;
    i - counter for cycle;
    k - variable for intermediate save. }

Begin
  // Check for input red bacterias
  repeat
    writeln('������� ���������� ������� ��������:');
    readln(Proverka);
    val(Proverka,RedB,errors);
    if (errors>0) or (RedB<0) then
    writeln('������� �������� ������')
  until (errors=0) and (RedB>=0);

  // Check for input ticks
    repeat
    writeln('������� ���������� ������:');
    readln(Proverka);
    val(Proverka,Tacts,errors);
    if (errors>0) or (Tacts<0) then
    writeln('������� �������� ������')
  until (errors=0) and (Tacts>=0);

  GreenB := 0;
  Writeln('_____________________________________________________________');
  Writeln('|  Tact  |   Red back-a   |   Green back-a   |     Total     |');
  Writeln('|________|________________|__________________|_______________|');
  // Cycle for counting bacteria
  for i := 0 to Tacts do
  begin
    // Checking for cycle
    if abs(GreenB) + abs(RedB) = GreenB + RedB then
    begin
      // Checking for output data
      if (GreenB + RedB >= 0) and (GreenB >= 0) and (RedB >= 0) then
      begin
        Writeln('|', i:8, '|', RedB:16, '|', GreenB:18, '|', (GreenB + RedB):15, '|');
        Writeln('|________|________________|__________________|_______________|');
      end;
      k := GreenB;
      GreenB := GreenB + RedB;
      RedB := k;
    end;
  end;
  Writeln('����� �� ������� ����������');
  readln;
End.
