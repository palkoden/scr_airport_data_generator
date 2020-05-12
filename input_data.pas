{  
   Constructor of interface for inputting SCR data, used by the generator.
   Data requiered:
    - airport IATA code
    - season
    - date of SCR message origin
    - date of slots requests generation
    - number of flights
    - middle value of load factor
    - value of diffusion for load factor
}

program input_data_constructor;

begin
  clrscr;
  flight_number := 0;
  diffusion := 0;
  gotoxy(1, 1);
  textcolor(yellow);
  textbackground(blue);
  write('                             INPUT DATA PREPARATION                             ');

  gotoxy(1, 11);
  textcolor(lightgreen);
  textbackground(black);
  write('Enter airport IATA code: ');

  gotoxy(1, 13);
  write('Enter the season for generating SCR message(s) (S20/W20): ');

  gotoxy(1, 15);
  write('Enter the date of origin SCR message(s) (DDMMM): ');

  gotoxy(1, 17);
  write('Enter the date of generating of Slots Requests (DDMMM): ');

  gotoxy(1, 19);
  write('Enter the number of generating flight(s): ');

  gotoxy(1, 21);
  write('Enter the middle value of Load Factor: ');

  gotoxy(1, 23);
  write('Enter the value of diffusion for Load Factor: ');

  textcolor(white);
  gotoxy(26, 11);
  readln(iata_code);
  gotoxy(59, 13);
  readln(season);
  gotoxy(50, 15);
  readln(date_request);
  gotoxy(57, 17);
  readln(date_scr);
  gotoxy(43, 19);
  readln(flight_number);
  gotoxy(40, 21);
  readln(load_factor);
  gotoxy(47, 23);
  readln(diffusion);

  a := load_factor - diffusion;
  b := load_factor + diffusion;
  
  normvideo;
end