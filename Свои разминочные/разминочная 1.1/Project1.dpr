Program Project1;
{ Output the number of monks of each type, if the
  leading monk eats 10 pies, the simple one has 5 pies,
  and the students eat 0.5 pies.The number of all monks and pies
  is entered from the keyboard }

{$APPTYPE CONSOLE} // Console application

uses
  System.SysUtils;

var
  NumV, NumPr, NumUch, mon, i: integer;
  Proverka1: string;
  prom, pir, pirV, PirPr, PirUch: extended;
  proverka: boolean;

  { NumV, NumPr, NumUch - the number of monks of each species;
    pir - the number of all pies;
    mon - the number of all monks;
    i - number of options;
    Proverka1 - check for input data;
    prom - intermediate calculations;
    pirV, PirPr, PirUch - the amount that each kind of monk eats;
    proverka - checker for input data. }

Begin
  // Check for input all monks
  proverka := false;
  repeat
    writeln('������� ���������� �������');
    readln(Proverka1);
    if trystrtoint(Proverka1, mon) = true then
    begin
      mon := strtoint(Proverka1);
      if mon < 0 then
        writeln('�������� ������ ���� �������������')
      else
        proverka := true;
    end
    else
      writeln('������������ ���� ������');
  until proverka = true;

  // Check for all input pies
  proverka := false;
  repeat
    writeln('������� ���������� �������');
    readln(Proverka1);
    if trystrtofloat(Proverka1, pir) = true then
    begin
      pir := strtofloat(Proverka1);
      if pir < 0 then
        writeln('�������� ������ ���� �������������')
      else
        proverka := true;
    end
    else
      writeln('������������ ���� ������');
  until proverka = true;

  // A series of checks for the number of pies consumed
  // by each type of monk
  proverka := false;
  repeat
    writeln('������� ���������� �������, ������� ��� 1 ������ �����');
    readln(Proverka1);
    if trystrtofloat(Proverka1, pirV) = true then
    begin
      pirV := strtofloat(Proverka1);
      if pirV < 0 then
        writeln('�������� ������ ���� �������������')
      else
        proverka := true
    end
    else
      writeln('������������ ���� ������');
  until proverka = true;

  proverka := false;
  repeat
    writeln('������� ���������� �������, ������� ��� 1 ������� �����');
    readln(Proverka1);
    if trystrtofloat(Proverka1, PirPr) = true then
    begin
      PirPr := strtofloat(Proverka1);
      if PirPr < 0 then
        writeln('�������� ������ ���� �������������')
      else
        proverka := true;
    end
    else
      writeln('������������ ���� ������');
  until proverka = true;

  proverka := false;
  repeat
    writeln('������� ���������� �������, ������� ��� 1 �����-������');
    readln(Proverka1);
    if trystrtofloat(Proverka1, PirUch) = true then
    begin
      PirUch := strtofloat(Proverka1);
      if PirUch < 0 then
        writeln('�������� ������ ���� �������������')
      else
        proverka := true;
    end
    else
      writeln('������������ ���� ������');
  until proverka = true;

  // Number of variants
  i := 0;
  // iterate over the number of high monks
  for NumV := 0 to trunc((pir / pirV)) do
  begin
    // solution of the system of equations
    prom := pir - PirUch * mon - NumV * (pirV - PirUch);
    // the number of simple monks must be whole and greater than 0
    if ((frac(prom / (PirPr - PirUch))) < 0.0000001) then
    begin
      NumPr := trunc(prom / (PirPr - PirUch));
      // the number of monks must be whole and greater than zero
      if (NumPr >= 0) then
      begin
        // the number of monks disciples
        NumUch := mon - NumPr - NumV;
        if (NumUch >= 0) then
        begin
          // counting the number of options
          i := i + 1;
          writeln('');
          writeln('������ ������� - ', NumV);
          writeln('������� ������� - ', NumPr);
          writeln('������� �������� - ', NumUch);
        end;
      end;
    end;
  end;
  writeln('');
  writeln('����� ���������� ��������� :', i);
  readln;

End.
