program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  N = 5;

var i,k,l,m,z:integer;
  A:array[0..N] of real;
  B:array[0..2*N] of real;
  check1:boolean;

begin
  k:=1;
  z:=0;

  check1:= true;
  for i := 0 to N do
  begin
    Writeln(' Введите  элемент ', i);
    Readln(A[i]);
  end;
  Writeln('Первое значение в скобках - элемент начального массива');
  Writeln('Второе значение в скобках - число повторений элемента элемента в массиве');
  for i := 0 to N do
  begin
    m:=0;
    k:=1;
    for l := i+1 to N do
    begin
      if (A[i] = A[l]) then
      begin
        k:=k+1;

      end;

    end;
      while m<=z do
      begin
        if B[m]=A[i] then check1:=false;
        m:=m+2;
      end;

      if check1 then
      begin
        B[z]:= A[i];
        B[z+1]:=k;
        write('(');
        write(B[z]:3:1);
        write(',');
        write(B[z+1]:3:1);
        write(')');
        z:=z+2;
      end;

  end;
  readln;
end.
