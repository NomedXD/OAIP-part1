Program lab7R2;
{ A sequence is given containing from 2 to 50 words,
  each of which has from 1 to 8 lowercase Latin letters;
  there is a comma or at least one space between adjacent
  words, followed by a period after the last word. Remove
  extra commas or spaces from the entered line.
  Print those words of the sequence that are different from
  the last word and satisfy the following property: each letter
  enters the word at least 3 times. }

{$APPTYPE CONSOLE} // Console app

// Modules declaration
Uses
  System.SysUtils;

// Variables declaration
Var
  Str, LastWord: string;
  Word, Letter, Temp: string;
  i, j, k, l, counterArr: integer;
  Checker: boolean;
  BoolMas: array [1 .. 8] of boolean;
  checkForK: boolean;
  WordArr: array [1 .. 50] of string;
  { Str - original string;
    LastWord - the last word;
    Word - current checking word;
    Letter - 1-st, 2-nd, etc. letter of Word;
    Temp - variable, which contains palindrom of LastWord;
    i - cycle counter;
    j - cycle counter;
    l - cycle counter;
    counterArr - cycle counter for array;
    k - the number of repetitions of the letter;
    Checker - variable, which is used to find mistakes and
    to delete words withrepeating letters;
    BoolMas - Logical array for "deleting" checked letters in a word;
    checkForK - variable to check the number of
    repetitions of letters in a word;
    WordArr - an array that stores all matching words. }

  // Start the program
Begin

  // Mistakes checker
  repeat

    // Set checker to the original value
    Checker := true;

    // Input String
    write('������� ���� ������: ');
    readln(Str);

    // Check condition of only english letters, allowing
    // input spaces and �ommas
    if length(Str) <> 0 then
    begin
      for i := 1 to length(Str) - 1 do
      begin
        if ((ord(Str[i]) < 96) or (ord(Str[i]) > 125)) and (Str[i] <> ' ') and
          (Str[i] <> ',') then
          Checker := false;
      end;
    end

    // If nothing was inputted
    else
      Str := ' '; (* In order to make insufficient input *)

    // If mistake was found
    if (Str[1] = ',') or (Str = '') or
      ((pos(' ', Str) = 0) and (pos(',', Str) = 0)) or (Checker = false) or
      (Str[length(Str)] <> '.') then
      writeln('������ �����');

    // If input is sufficient
  until (Str[1] <> ',') and (Checker = true) and (Str[length(Str)] = '.') and
    (Str <> '') and ((pos(' ', Str) <> 0) or (pos(',', Str) <> 0));

  // Removing extra commas
  for i := 1 to length(Str) do
  begin
    if (Str[i] = Str[i + 1]) and (Str[i] = ',') then
    begin
      repeat
        delete(Str, i + 1, 1);
      until Str[i] <> Str[i + 1];
    end;
  end;

  // Removing extra spaces before the dot
  repeat
    if Str[length(Str) - 1] = ' ' then
      delete(Str, length(Str) - 1, 1);
  until (Str[length(Str) - 1] <> ' ');

  // Set Temp to the original value
  Temp := '';

  // Set i to the original value
  i := length(Str) - 1;

  // Find palindrom of the last word
  while (Str[i] <> ',') and (Str[i] <> ' ') do
  begin
    Temp := Temp + copy(Str, i, 1);
    dec(i);
  end;

  // Set LastWord to the original value
  LastWord := '';

  // Write palindrom of the last word in reverse order
  for i := 1 to length(Temp) do
    LastWord := Temp[i] + LastWord;

  // Output original string and last word
  writeln('��������������� ������: ', Str);
  writeln('��������� �����: ', LastWord);
  write('���������� ����� ��� �������: ');

  // Set i and counterArr to the original value
  i := 1;
  counterArr := 1;

  // While Str[i] not equals '.'
  while Str[i] <> '.' do
  begin

    // If new word was found
    if (Str[i] <> ' ') and (Str[i] <> ',') then
    begin

      // Set checker to the original value
      Checker := true;

      // Set Word to the original value
      Word := '';

      // Find Word
      while (Str[i] <> ' ') and (Str[i] <> ',') and (i < length(Str)) do
      begin
        Word := Word + Str[i];
        inc(i);
      end;

      // Boolean massive for removing checking letters from Word
      for l := 1 to 8 do
        BoolMas[l] := true;

      // Check if there are repeated letters in Word
      j := 1;
      // Set checkForK to the original value
      checkForK := true;
      while (j <= length(Word)) and (checkForK = true) do
      begin

        // If this letter hasn't been there yet
        if BoolMas[j] = true then
        begin

          // Copy 1-st, 2-nd, ... letter of the word
          Letter := copy(Word, j, 1);

          // Number of repetitions of a new letter
          k := 1;

          // Search for repetitions of letters and their "removal"
          for l := j + 1 to length(Word) do
          begin
            if Letter = Word[l] then
            begin
              // Increasing the number of repetitions
              k := k + 1;
              // "Delete" the letter
              BoolMas[l] := false;
            end;
          end;

          // Check for at least 3 repetitions of the
          // letter in the word, if this is incorrect,
          // do not check this word further
          if k < 3 then
            checkForK := false

        end;
        j := j + 1;
      end;

      // If found word is not equals to last word and
      // there is no repeated lettters
      if (Word <> LastWord) and (checkForK = true) then
      begin
        // Filling the array for output
        WordArr[counterArr] := Word;
        counterArr := counterArr + 1;
      end;

    end

    // If we met space or comma
    else
      inc(i);

  end;
  // Printing all words from array
  for i := 1 to counterArr - 1 do
  begin
    Write(WordArr[i], ' ');
  end;
  // Final operations
  readln;

End.
