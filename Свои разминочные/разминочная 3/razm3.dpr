Program razm3;

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

const
  CostD = 11.5;
  CostK = 114.5;
  CostY = 1255;

Var
  Numd,Numk,Numy,k,m:int64;
  sum0:real;
  { Numd - ���������� ������;
  Numk - ���������� �������;
  Numy - ���������� ������;
  sum0 - ��������� ������ �� �����������. }

Begin
  writeln('������� ���������� ������:');
  readln(Numd);
  // ����� ���� ������ ��� ������� ��-�����������
  sum0:=Numd*CostD;
  // ����� ���������� ���������� ������
  Numy:=Numd div 144;
  Numd:=Numd mod 144;
  // ����� ���������� ���������� �������
  Numk:=Numd div 12;
  Numd:=Numd mod 12;
  k:=Numd;
  // ��������, �������� �� ������ ������ ������� ������ ������
  if Numd*CostD>=CostK then
  begin
    // ���������� ������� ������, ��� ������ ������ ��������� ������
    writeln('');
    Writeln('���������� ����� �������� ��������, ����� ����� ������� :', floattostr(sum0));
    // ��������� ���������� ������
    Numd:=0;
    // ������ ���������� ���������� ������ ��������
    Numk:=Numk+1;
    writeln('');
    writeln('�������� ����� ������:');
    writeln('������ - ', Numy);
    writeln('������� - ', Numk);
    writeln('������ - ', Numd);
    writeln('��������� ����� ������� ��������: ', floattostr(Numd*CostD+Numk*CostK+Numy*CostY));
    Writeln('����� ����������� �� ��������� � ��������� �������: ' + floattostr(sum0-(Numd*CostD+Numk*CostK+Numy*CostY)) + ' ������');
    Writeln('������ ������ ����� �������� :', 12-k);
    readln;
  end
  else
  // ��������, �������� �� ������ ������� ���� ������ �������
  if Numk*CostK>=CostY then
  begin
    // ���������� ������� ������ � �������, ��� ������ ������ ��������� ������
    k:=Numd;
    m:=Numk;
    writeln('');
    Writeln('���������� ����� �������� ��������, ����� ����� ������� :', floattostr(sum0));
    // ��������� ���������� ������ � �������
    Numd:=0;
    Numk:=0;
    // ������ ���������� ���������� ������ � ������� ������
    Numy:=Numy+1;
    writeln('');
    writeln('�������� ����� ������:');
    writeln('������ - ', Numy);
    writeln('������� - ', Numk);
    writeln('������ - ', Numd);
    writeln('��������� ����� ������� ��������: ' + floattostr(Numd*CostD+Numk*CostK+Numy*CostY) + ' ������');
    Writeln('����� ����������� �� ��������� � ��������� �������: ' + floattostr(sum0-(Numd*CostD+Numk*CostK+Numy*CostY)) + ' ������');
    Writeln('������ ������ ����� �������� :', 144-m*12-k);
    readln;
  end
  else
  // ���� ��� ��������� ����� �������� �������
  begin
    writeln('');
    Writeln('���������� ����� �������� ��������, ����� ����� ������� :', floattostr(sum0));
    writeln('');
    writeln('�������� ����� ������:');
    writeln('������ - ', Numy);
    writeln('������� - ', Numk);
    writeln('������ - ', Numd);
    writeln('��������� ����� ������� ��������: ', floattostr(Numd*CostD+Numk*CostK+Numy*CostY));
    Writeln('����� ����������� �� ��������� � ��������� �������: ' + floattostr(sum0-(Numd*CostD+Numk*CostK+Numy*CostY)) + ' ������');
    readln;
  end;
End.

