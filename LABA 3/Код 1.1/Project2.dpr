Program Lab3;
{ The program outputs various numbers of the input array,
  as well as the number of repetitions of each number.
  This data is stored in another array,
  where B[i] are different numbers,
  B[i+1] is the number of repetitions of the number }

{$APPTYPE CONSOLE} // Console application

{$R *.res}

// Modules declaration
uses
  System.SysUtils;

// Variables declaration
var
  i, k, l, m, N, z, errors: integer;
  A: array [0 .. 1000] of real;
  B: array [0 .. 2000] of real;
  check1: boolean;
  vvod: string;
  { l - cycle counter;
    i - cycle counter/ndexes of array A;
    k - number of repetitions of the number;
    m,z - indexes of array B
    N - array size A;
    A - initial array;
    B - the final array;
    check1 - variable for checking input;
    vvod - variable for checking input; }

Begin
  k := 1;
  z := 0;
  // Checking the input
  repeat
    Writeln('??????? ?????? ???????');
    Readln(vvod);
    val(vvod, N, errors);
    if (errors > 0) or (N <= 0) then
      Writeln('??????? ???????? ?????? ???????');
  until (errors = 0) and (N > 0);

  // Filling the array A
  for i := 0 to N do
  begin
    repeat
      Writeln(' ??????? ', i, ' -??(??) ??????? ???????');
      Readln(vvod);
      val(vvod, A[i], errors);
      if (errors > 0) then
        Writeln('??????? ???????? ???? ???????');
    until (errors = 0);
  end;
  Writeln('?????? ???????? ? ??????? - ??????? ?????????? ???????');
  Writeln('?????? ???????? ? ??????? - ????? ?????????? ???????? ???????? ? ???????');
  // Search for matching elements
  for i := 0 to N do
  begin
    check1 := true;
    m := 0;
    k := 1;
    for l := i + 1 to N do
    begin
      if (A[i] = A[l]) then
      begin
        k := k + 1;
      end;
    end;
    // Checking for matches with elements of array B
    while m <= z do
    begin
      if A[i] = B[m] then
        check1 := false;
      m := m + 2;
    end;
    // Filling the array B
    if check1 then
    begin
      B[z] := A[i];
      B[z + 1] := k;
      write('(');
      write(B[z]:0:3);
      write(',');
      write(trunc(B[z + 1]));
      write(')');
      z := z + 2;
    end;
  end;
  Readln;

End.
