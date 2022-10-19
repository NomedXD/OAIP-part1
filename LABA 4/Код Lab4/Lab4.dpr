Program Lab4;
  {The ptogram output the numbers that
  are in each row of a two-dimensional array }

{$APPTYPE CONSOLE} // Console application

// Modules declaration
Uses
  System.SysUtils;

// Cost declaration
Const
  N = 4;

// Variables declaration
Var
  i, j, m, k,error: integer;
  Arr: array [1 .. N, 1 .. N] of integer;
  check: boolean;
  vvod:string;
  { i,j,m - Array indexes, cycle counters;
    k - check for coincidence in a number of numbers;
    Arr - Initial array;
    check - check for coincidence in a number of numbers. }

Begin
  // Filling the array Arr
  for i := 1 to N do
  begin
    repeat
      Writeln('������� ������� �������: ', '[', i, ',', 1, ']');
      Readln(vvod);
      val(vvod,Arr[i, 1],error);
      if error>0 then
      begin
        Writeln('�� ����� �������� ���� �������');
      end;
    until error=0;
    for j := 2 to N do
    begin
      repeat
        repeat
          Writeln('������� ������� �������: ', '[', i, ',', j, ']');
          Readln(vvod);
          val(vvod,Arr[i, j],error);
          if error>0 then
          begin
            Writeln('�� ����� �������� ���� �������');
          end;
        until error=0;
        if Arr[i, j] <= Arr[i, j - 1] then
        writeln('������ � ������� ������������� �� �����������, ������� ����� ������ �����������');
      until Arr[i, j] >= Arr[i, j - 1];
    end;
  end;

  // Printing array Arr
  writeln;
  writeln('�������� ������: ');
  for i := 1 to N do
  begin
    for j := 1 to N do
    begin
      write(Arr[i, j]:4, ' ');
    end;
    Writeln;
  end;

  // Searching for coincidence in a number of numbers
  write('������������� ��������: ');
  for m := 1 to N do
  begin
    check := true;
    for i := 2 to N do
    begin
      if check = true then
      begin
        k := 0;
        j := 1;
        while (Arr[1, m] >= Arr[i, j]) and (j <= N) do
        begin
          if Arr[1, m] = Arr[i, j] then
          k := k + 1;
          j := j + 1;
        end;

        // Checking for matches in a row
        if k = 0 then
        check := false;
      end;
    end;
    if check = true then
    write(Arr[1,m],' ');
  end;
  Readln;

End.
