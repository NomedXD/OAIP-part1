Program Lab3R4;
{ The program outputs various numbers of the input array,
  as well as the number of repetitions of each number.
  This data is stored in another array,
  where B[i] are different numbers,
  B[i+1] is the number of repetitions of the number }

{$APPTYPE CONSOLE} // Console application

// Modules declaration
Uses
  System.SysUtils;

// Cost declaration
Const
  N=20;
// Variables declaration
Var
  i, k, l, m, z, errors: integer;
  B: array [1 .. 2000] of real;
  A: array [1 .. N] of real =(117,223,56,-132,777,90,5.5,-132,54,88,34,910,2345,55,99,73,-58,23,55,70);
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
  z := 1;
  Writeln('?????? ???????? ? ??????? - ??????? ?????????? ???????');
  Writeln('?????? ???????? ? ??????? - ????? ?????????? ???????? ???????? ? ???????');

  // Search for matching elements
  for i := 1 to N do
  begin
    check1 := true;
    m := 1;
    k := 1;
    for l := i + 1 to N do
    begin
      if (A[i] = A[l]) then
      k := k + 1;
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
      Write('(');
      Write(B[z]:0:1);
      Write(',');
      Write(trunc(B[z + 1]));
      Write(')');
      z := z + 2;
    end;
  end;
  Readln;

End.
