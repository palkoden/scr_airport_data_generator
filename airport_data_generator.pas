{
    Airport data generator - it uses the data from the input_data.pas script
    to generate the airport dataset. 

}


program airport_data_generator;

begin
  clrscr;
  randomize;

  Assign(f, 'data.txt'); { File for writting is created and opened. }
  rewrite(f);

  textcolor(yellow);
  textbackground(blue);
  write('                            AIRPORT DATA GENERATING                             ');

  textbackground(black);
  writeln;
  textcolor(lightgreen);
  writeln('FLT_Nr   A/C    L_F   PAX   STA     STD');

  writeln(f, 'FLT_Nr   A/C    L_F   PAX   STA    STD');

{ Flight number iterator - from 1 to number of flights, inputted by the user. }
  for i := 1 to flight_number do
  begin
    x[i] := random(b - a) + a;
    ac[i] := random(act) + 1;
    CI[i] := random(139) + 1;
    arrival_h := (CI[i] * 10) div 60;
    arrival_m := (CI[i] * 10) - (arrival_h * 60);
    departure_h := ((CI[i] + 5) * 10) div 60;
    departure_m := ((CI[i] + 5) * 10) - (departure_h * 60);
    if ac[i] = 1 then
    begin
      types := 'B735';
      PAX[i] := round((seat_cap1 / 100) * x[i]);
    end;
    if ac[i] = 2 then
    begin
      types := 'A320';
      PAX[i] := round((seat_cap2 / 100) * x[i]);
    end;
    if ac[i] = 3 then
    begin
      types := 'B738';
      PAX[i] := round((seat_cap3 / 100) * x[i]);
    end;
    if ac[i] = 4 then
    begin
      types := 'B752';
      PAX[i] := round((seat_cap4 / 100) * x[i]);
    end;
    if ac[i] = 5 then
    begin
      types := 'A321';
      PAX[i] := round((seat_cap5 / 100) * x[i]);
    end;
    if ac[i] = 6 then
    begin
      types := 'B753';
      PAX[i] := round((seat_cap6 / 100) * x[i]);
    end;
    if ac[i] = 7 then
    begin
      types := 'A310';
      PAX[i] := round((seat_cap7 / 100) * x[i]);
    end;
    if ac[i] = 8 then
    begin
      types := 'A330';
      PAX[i] := round((seat_cap8 / 100) * x[i]);
    end;
    textcolor(white);
    if (arrival_m = 0) and (departure_m = 0) then
    begin
      write('FLT ', i: 2, '   ', types: 4, '  ', x[i]: 3, '%   ', PAX[i]: 3, '   ', arrival_h: 2);
      writeln(':', arrival_m, '0   ', departure_h: 2, ':', departure_m, '0');
      write(f, 'FLT ', i: 2, '   ', types: 4, '  ', x[i]: 3, '%   ', PAX[i]: 3, '   ', arrival_h: 2);
      writeln(f, ':', arrival_m, '0   ', departure_h: 2, ':', departure_m, '0');
    end;
    if (arrival_m = 0) and (departure_m > 0) then
    begin
      write('FLT ', i: 2, '   ', types: 4, '  ', x[i]: 3, '%   ', PAX[i]: 3, '   ', arrival_h: 2);
      writeln(':', arrival_m, '0   ', departure_h: 2, ':', departure_m);
      write(f, 'FLT ', i: 2, '   ', types: 4, '  ', x[i]: 3, '%   ', PAX[i]: 3, '   ', arrival_h: 2);
      writeln(f, ':', arrival_m, '0   ', departure_h: 2, ':', departure_m);
    end;
    if (arrival_m > 0) and (departure_m = 0) then
    begin
      write('FLT ', i: 2, '   ', types: 4, '  ', x[i]: 3, '%   ', PAX[i]: 3, '   ', arrival_h: 2);
      writeln(':', arrival_m, '   ', departure_h: 2, ':', departure_m, '0');
      write(f, 'FLT ', i: 2, '   ', types: 4, '  ', x[i]: 3, '%   ', PAX[i]: 3, '   ', arrival_h: 2);
      writeln(f, ':', arrival_m, '   ', departure_h: 2, ':', departure_m, '0');
    end;
    if (arrival_m > 0) and (departure_m > 0) then
    begin
      write('FLT ', i: 2, '   ', types: 4, '  ', x[i]: 3, '%   ', PAX[i]: 3, '   ', arrival_h: 2);
      writeln(':', arrival_m, '   ', departure_h: 2, ':', departure_m);
      write(f, 'FLT ', i: 2, '   ', types: 4, '  ', x[i]: 3, '%   ', PAX[i]: 3, '   ', arrival_h: 2);
      writeln(f, ':', arrival_m, '   ', departure_h: 2, ':', departure_m);
    end;
  end;

  Close(f);
  readln;
  normvideo;
end