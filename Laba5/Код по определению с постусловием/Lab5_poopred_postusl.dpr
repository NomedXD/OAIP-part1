Program Lab5_poopred_postusl;
  { The program calculates the value of the converging
  function for two precisions Eps1 and Eps2 using an
  iterative cycle with a postcondition by definition. }

{$APPTYPE CONSOLE} // Console application

// Modules declaration
Uses
  System.SysUtils;

// Declaration of constants
Const
  Eps1 = 0.00001;
  Eps2 = 0.000001;

// Variables declaration
Var
  k,l: integer;
  x,y0,y,dt,t1,t2: real;
  check:boolean;
  { k,l - the number of members of the sum of the function;
    x - function argument;
    y0,y - function values;
    dt - difference of two function values;
    t1,t2 - part of the function value;
    check - checking of value for Eps1. }

Begin
  x := 0.1;
  // Function argument cycle
  while x <= 0.9 do
  begin
    check:=false;
    k:=1;
    y0:=x/3;

    // Checking difference value for Eps2
    repeat
      t1:=exp((2*k+1)*ln(x));
      t2:=(4*k+1)*(4*k+3);
      y:= y0+ t1/t2;
      l:=k;
      k:=k+1;
      dt:=y-y0;

      // Checking of value for Eps1 in Eps2 cycle
      if (abs(dt)<=Eps1) and (check=false) then
      begin
        // Output for Eps1
        writeln('При x= ',x:1:1,': y=',y:10:7,' k=',(k-1):3,'  точность Eps= ',Eps1:1:5);
        check:=true;
      end;
      y0:=y;
    until abs(dt)<=Eps2;
    // Output for Eps2
    writeln('При x= ',x:1:1,': y=',y:10:7,' k=',l:3,'  точность Eps=',Eps2:1:6);
    writeln('______________________________________________________');
    x:=x+0.1;
  end;
   readln;
   readln;
End.
