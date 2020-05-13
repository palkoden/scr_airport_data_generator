{  
    SCR generator - it uses the data from the input_data.pas script
    to generate the SCR message. 
    It also contains a definition of aircraft seating capacity. Value for
    the seating is taken from const.pas and is connected to the exact planes.
    Example - "if ac[i]=1 then name:=seat_cap1_s+'B735';" matches seat_cap1_s const
    from const.pas file with Boeing 735
}

program scr_generator;

begin
  clrscr;
  randomize;
  textcolor(white);
  writeln('SCR');
  writeln(season);
  writeln(date_request);
  writeln(iata_code);

{ Flight number iterator - from 1 to number of flights, inputted by the user. }
  for i := 1 to flight_number do
  begin

    {
        Random generator of "ac" (random index for aircrafts) and "CI" (cyclic interval)
        variables. It also generates aircraft arrival_h/m, departure_h/m values.
    }
    ac[i] := random(act) + 1;
    CI[i] := random(144) + 1;
    arrival_h := (CI[i] * 10) div 60;
    arrival_m := (CI[i] * 10) - (arrival_h * 60);
    departure_h := ((CI[i] + 5) * 10) div 60;
    departure_m := ((CI[i] + 5) * 10) - (departure_h * 60);
    if ac[i] = 1 then
      Name := seat_cap1_s + 'B735';
    if ac[i] = 2 then
      Name := seat_cap2_s + 'A320';
    if ac[i] = 3 then
      Name := seat_cap3_s + 'B738';
    if ac[i] = 4 then
      Name := seat_cap4_s + 'B752';
    if ac[i] = 5 then
      Name := seat_cap5_s + 'A321';
    if ac[i] = 6 then
      Name := seat_cap6_s + 'B753';
    if ac[i] = 7 then
      Name := seat_cap7_s + 'A310';
    if ac[i] = 8 then
      Name := seat_cap8_s + 'A330';
    if i < 10 then
      write('N FLT0', i, ' ');
    if i > 9 then
      write('N FLT', i, ' '); 
    
    { SCR message generator. }
    if arrival_h > 9 then
    begin
      if arrival_m > 0 then
      begin
        write(date_SCR, date_SCR, ' ', Name, ' ABC', arrival_h: 2, arrival_m, ' ');
        if departure_h > 9 then
          write(departure_h);
        if departure_h < 10 then
          write('0', departure_h);
        if departure_m > 0 then
          write(departure_m);
        if departure_m = 0 then
          write(departure_m, '0');
        writeln('ABC CC');
      end;
      if arrival_m = 0 then
      begin
        write(date_SCR, date_SCR, ' ', Name, ' ABC', arrival_h: 2, arrival_m, '0 ');
        if departure_h > 9 then
          write(departure_h);
        if departure_h < 10 then
          write('0', departure_h);
        if departure_m > 0 then
          write(departure_m);
        if departure_m = 0 then
          write(departure_m, '0');
        writeln('ABC CC');
      end;
    end;
    if arrival_h < 10 then
    begin
      if arrival_m > 0 then
      begin
        write(date_SCR, date_SCR, ' ', Name, ' ABC', '0', arrival_h, arrival_m, ' ');
        if departure_h > 9 then
          write(departure_h);
        if departure_h < 10 then
          write('0', departure_h);
        if departure_m > 0 then
          write(departure_m);
        if departure_m = 0 then
          write(departure_m, '0');
        writeln('ABC CC');
      end;
      if arrival_m = 0 then
      begin
        write(date_SCR, date_SCR, ' ', Name, ' ABC', '0', arrival_h, arrival_m, '0 ');
        if departure_h > 9 then
          write(departure_h);
        if departure_h < 10 then
          write('0', departure_h);
        if departure_m > 0 then
          write(departure_m);
        if departure_m = 0 then
          write(departure_m, '0');
        writeln('ABC CC');
      end;
    end;
  end;
  readln;
  normvideo;
end