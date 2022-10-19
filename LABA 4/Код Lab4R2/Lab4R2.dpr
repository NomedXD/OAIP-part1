Program Lab4R2;
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
  i, j, m: integer;
  Arr: array [1 .. N, 1 .. N] of integer;
  check,check2: boolean;
  { i,j,m - Array indexes, cycle counters;
    check2 - check for coincidence in a number of numbers.
    Arr - Initial array;
    check - check for coincidence in a number of numbers. }

Begin
  // Filling the array Arr
  for i := 1 to N do
  begin
    Arr[i,1]:=Random(100)-50;
    for j := 2 to N do
    begin
      repeat
        Arr[i,j]:=Random(100)-50;
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
  check2 := true;
  // Outer loop through 1st line
  for m := 1 to N do
  begin
    check := true;

    // Loop through the rest of the lines
    i := 2;
    while (i <= N) and (check = true) and (check2 = true) do
    begin
      check := false;
      j := 1;

      // Loop until the item being checked is
      // larger than the item in the line
      while (Arr[1, m] >= Arr[i, j]) and (j <= N) and (check = false) do
      begin
        // Checking for a match
        if Arr[1, m] = Arr[i, j] then
          check := true;
        j := j + 1;
      end;
      i:=i+1;
    end;

    // Output matching element
    if (check = true) and (check2 = true) then
      write(Arr[1, m], ' ');

    // Checking if the next element in the first
    // line matches the previous one
    if Arr[1, m] = Arr[1, m + 1] then
      check2 := false
    else
      check2 := true;

  end;

  Readln;

End.
