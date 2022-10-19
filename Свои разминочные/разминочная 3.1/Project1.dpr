Program razm3;
{ output a way to purchase a certain number
  of floppy disks with maximum benefit }

{$APPTYPE CONSOLE} // Console appication

uses
  System.SysUtils;

// Fixed cost
const
  CostD = 11.5; // Price of one disc
  CostK = 114.5; // Price of one box
  CostY = 1255; // Price of one crate

Var
  Numd, Numk, Numy, k, errors: integer;
  Sum0: real;
  Proverka1: string;
  { Numd - Number of disks;
    Numk - Number of boxes;
    Numy - Number of crates;
    sum0 - The cost of the disks separately;
    Proverka1 - checker for input data;
    errors - checker for input data. }

Begin
  // Check for input data
  repeat
    writeln('Введите количество дисков:');
    readln(Proverka1);
    val(Proverka1, Numd, errors);
    if (errors > 0) or (Numd <= 0) then
    begin
      writeln('Введены неверные денные');
    end;
  until (errors = 0) and (Numd > 0);

  // Calculation of favorable terms of purchase
  Sum0 := Numd * CostD;
  Numy := Numd div 144;
  Numd := Numd mod 144;
  Numk := Numd div 12;
  Numd := Numd mod 12;
  k := Numd;

  // Finding additional benefits
  if (Numd * CostD >= CostK) or (Numk * CostK >= CostY) then
  begin
    // More profitable to buy a box instead of floppy disks
    if Numd * CostD >= CostK then
    begin
      Numd := 0;
      Numk := Numk + 1;
    end;
    // More profitable to buy a case instead of a box
    if Numk * CostK >= CostY then
    begin
      Numd := 0;
      Numk := 0;
      Numy := Numy + 1;
    end;

    writeln('');
    writeln('Невыгоднее всего покупать поштучно, сумма такой покупки :',
      floattostr(Sum0));
    writeln('Выгоднее всего купить:');
    writeln('Ящиков - ', Numy);
    writeln('Коробок - ', Numk);
    writeln('Дисков - ', Numd);
    writeln('Стоимость такой покупки составит: ' + floattostr(Numd * CostD +
      Numk * CostK + Numy * CostY) + ' рублей');
    writeln('Будет сэкономлено по отношению к поштучной покупке: ' +
      floattostr(Sum0 - (Numd * CostD + Numk * CostK + Numy * CostY)) +
      ' рублей');
    writeln('Лишних дисков будет куплено: ', 12 - k);
    readln;
  end
  else
  // No additional benefit
  begin
    writeln('');
    writeln('Невыгоднее всего покупать поштучно, сумма такой покупки :',
      floattostr(Sum0));
    writeln('Выгоднее всего купить:');
    writeln('Ящиков - ', Numy);
    writeln('Коробок - ', Numk);
    writeln('Дисков - ', Numd);
    writeln('Стоимость такой покупки составит: ' + floattostr(Numd * CostD +
      Numk * CostK + Numy * CostY) + ' рублей');
    writeln('Будет сэкономлено по отношению к поштучной покупке: ' +
      floattostr(Sum0 - (Numd * CostD + Numk * CostK + Numy * CostY)) +
      ' рублей');
    readln;
  end;
End.
