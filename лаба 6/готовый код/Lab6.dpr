Program Lab6;
  { Every year, Teacher's Day is celebrated on the first
    Sunday in October each year. A natural number is given,
    denoting the number of the year. The program determines
    the number of teachers this year. }

{$APPTYPE CONSOLE} // Console application;

// Modules declaration
Uses
  System.SysUtils;

// Declaration of types
Type
  CommonDays = 1 .. 31;
  Months = (������, �������, ����, ������, ���, ����, ����, ������, ��������,
    �������, ������, �������);
  Week_Days_Type = (�����������, �����������, �������, �����, �������,
    �������, �������);
  { CommonDays - indicates the number of the day. Type - type-range;
    Months - contains all months of the year, numbering in this
    type starts from 0. Type - enumerated type;
    Week_Days_Type - contains all days of the week, numbering in this
    type starts from 0. Type - enumerated type . }

// Declaration of constants
Const
  MonthDays: array [1 .. 12] of byte = (31, 28, 31, 30, 31, 30, 31, 31, 30,
    31, 30, 31);
  { MonthDays - an array containing the number of all days in each month.
    Starts from January. }

// Variables declaration
Var
  year, octoberfirstweekday: integer;
  days, counter: integer;
  teachersMonthIndex: integer;
  teachersDay: CommonDays;
  teachersMonth: Months;
  counterMonths: Months;
  teachersWeekDay: Week_Days_Type;
  vvod: string;
  error: integer;
  { year - entered year;
    octoberfirstweekday - number of the first day of the week of October;
    days - number of days;
    counter - variable for loop;
    teachersMonthIndex - �ctober index in custom type;
    teachersDay - teacher's day;
    teachersMonth - month of teacher's day in custom type;
    counterMonths - cycle counter for adding leap days;
    teachersWeekDay - variable to switch between days of the week in a loop;
    vvod - variable to input;
    error - error counter. }

Begin
  // Enter the year in which to check when is Teacher's Day
  repeat
    write('�������, ����������, ����� ����(����������� �������� - 1, ������������ - 2100): ');
    readln(vvod);

    // A procedure that converts an input string to a numeric
    // value to check for input errors
    val(vvod,year,error);

    // Checking for errors
    if (error>0) or (year<1) or (year>2100) then
    begin
      Writeln('�� ������ �������� ������, ��������� �������');
    end;

  // Exit condition
  until (error=0) and (year>=1) and (year<=2100);;

  // Assigning values to variables, for orientation
  // in a user-defined data type
  teachersMonth := �������;
  teachersMonthIndex := 9;

  // Counting the number of days that have passed from 1 year inclusive,
  // up to the current year, excluding leap days
  days := (year - 1) * 365;

  // Adding all days that passed before October
  counter := 1;
  for counterMonths := ������ to Months(teachersMonthIndex - 1) do
  begin
    // Adding days
    inc(days, MonthDays[counter]);
    // Move to next month
    inc(counter);
  end;

  // Adding days that were in leap years
  for counter := 1 to year do
  begin
    // Leap year condition
    if (counter mod 4 = 0) and not((counter mod 100 = 0) and
      (counter mod 400 <> 0)) then
      // Adding days
      inc(days);
  end;

  // Transition to the 1st day of October
  inc(days);

  // Finding the day number of the week for the first day of October
  octoberfirstweekday := days mod 7;

  // We assume that the teacher's day falls on the 1st day,
  // that is, on the 1st day of October
  teachersWeekDay := Week_Days_Type(octoberfirstweekday);
  teachersDay := 1;

  // Start the search for a real teacher's day
  while teachersWeekDay <> ����������� do
  begin
    // Compare the day of the week on the 1st of October with Saturday
    if teachersWeekDay = ������� then
    begin
      // Go to the zero index in the data type
      teachersWeekDay := Week_Days_Type(0);
      // Increase the number of days in a month
      inc(teachersDay);
    end
    else
    begin
      // Go the next day of the week
      teachersWeekDay := succ(teachersWeekDay);
      // Increase the number of days in a month
      inc(teachersDay);
    end;

  end;
  writeln(teachersDay, ' ������� ', year, ' ����');
  readln;

End.
