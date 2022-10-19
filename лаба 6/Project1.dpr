    program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  CommonDays = 1..31;
  Months = (Январь, Февраль, Март, Апрель, Май, Июнь, Июль, Август, Сентябрь, Октябрь, Ноябрь, Декабрь);
  Week_Days_Type = (Воскресение, Понедельник, Вторник, Среда, Четверг, Пятница, Суббота);
Const
  MonthDays: array[1..12] of byte = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
  Week_Days: array[0..6] of String = ('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
var
  sundayCounter: integer;
  startYear, octoberfirstweekday: integer;
  currentMonth: integer;
  days, counter: integer;
  teachersDay: CommonDays;
  teachersMonth: Months;
  counterMonths: Months;
  teachersWeekDay: Week_Days_Type;
  teachersMonthIndex: integer;
begin
  startYear := 2021;
  teachersMonth := Октябрь;
  days := (startYear-1)*365;

  if teachersMonth = Октябрь then
     teachersMonthIndex := 9;

counter := 1;

//Adding days in months
for counterMonths := Январь to Months(teachersMonthIndex - 1) do
begin
inc(days, MonthDays[counter]);
inc(counter);
end;

  //Adding days
  inc(days);

  //Except not leap years
  for  counter := 1 to startYear do
    if (counter mod 4 = 0) and not((counter mod 100 = 0) and (counter mod 400 <> 0)) then
      inc(days);

  octoberFirstWeekDay := days mod 7;
  teachersDay := 1;
  teachersWeekDay := Week_Days_Type(octoberFirstWeekDay);

  while teachersWeekDay <> Воскресение do
  begin
    if teachersWeekDay = Суббота then
    begin
      teachersWeekDay := Week_Days_Type(0);
      inc(teachersDay);
    end
    else
    begin
      teachersWeekDay := succ(teachersWeekDay);
      inc(teachersDay);
    end;

  end;
  writeln(teachersDay, ' октября ', startYear, ' года');
  readln;
end.
