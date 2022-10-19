Program Lab3R3;
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

Const
  N=20;
Const
  A: array [0 .. N] of real =(5.5,117,223,56,-132,777,90,5.5,-132,54,88,34,910,2345,55,99,73,-58,23,55,70);

// Variables declaration
var
  i, k, l, m, z, errors: integer;
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
  Writeln('Первое значение в скобках - элемент начального массива');
  Writeln('Второе значение в скобках - число повторений элемента элемента в массиве');
  // Search for matching elements
  for i := 0 to N do
  begin
    check1 := true;
    m := 0;
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
      Write(B[z]:0:3);
      Write(',');
      Write(trunc(B[z + 1]));
      Write(')');
      z := z + 2;
    end;
  end;
  Readln;

End.
