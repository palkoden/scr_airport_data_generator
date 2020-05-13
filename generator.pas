uses crt, graph;
var gm, gd: integer;
    key: char;
    a,b,i, flight_number, diffusion, arrival_h, arrival_m, departure_h, departure_m: integer;
    load_factor: integer;
    ac: array[1..8] of integer;
    x: array[1..200] of integer;
    CI: array[1..144] of integer;
    PAX: array[1..500] of integer;
    date_request: string;
    date_SCR: string;
    iata_code: string;
    season: string;
    types: string;
    name: string;
    f: text;

const act=8;
      seat_cap1_s='145';
      seat_cap2_s='180';
      seat_cap3_s='189';
      seat_cap4_s='200';
      seat_cap5_s='230';
      seat_cap6_s='243';
      seat_cap7_s='265';
      seat_cap8_s='300';

      seat_cap1=145;
      seat_cap2=180;
      seat_cap3=189;
      seat_cap4=200;
      seat_cap5=230;
      seat_cap6=243;
      seat_cap7=265;
      seat_cap8=300;

begin
   repeat
      Gd:= detect;
      InitGraph(Gd, Gm, '');

      if GraphResult <> grOk then Halt(1);

      setfillstyle(1,8);
      bar(0,0,639,479);

      setfillstyle(1,1);
      bar(0,10,639,45);

      setcolor(14);
      settextstyle(0,0,2);
      outtextxy(152,20,'SCR AND PAX GENERATOR');

      setcolor(11);
      outtextxy(250,110,'Main Menu');

      setfillstyle(1,0);
      bar(149, 189, 251, 291);
      bar(269, 189, 371, 291);
      bar(389, 189, 491, 291);
      bar(509, 399, 611, 451);

      setfillstyle(1,15);
      bar(150, 190, 250, 290);
      bar(270, 190, 370, 290);
      bar(390, 190, 490, 290);
      bar(510, 400, 610, 450);

      setcolor(4);
      settextstyle(0,0,0);
      outtextxy(240, 200,'1');
      setcolor(1);
      outtextxy(161, 230,'Input Data');
      outtextxy(157, 250,'Preparation');

      setcolor(4);
      outtextxy(360, 200,'2');
      setcolor(1);
      outtextxy(290, 230,'SCR Data');
      outtextxy(281, 250,'Generating');

      setcolor(4);
      outtextxy(480, 200,'3');
      setcolor(1);
      outtextxy(393, 230,'Airport Data');
      outtextxy(402, 250,'Generating');

      setcolor(4);
      outtextxy(600, 410,'E');
      setcolor(1);
      outtextxy(547, 425,'Exit');

      key:=readkey;
      closegraph;
      if key='1' then
      begin
         clrscr;
         flight_number:=0;
         diffusion:=0;
         gotoxy(1,1);
         textcolor(yellow);
         textbackground(blue);
         write('                             INPUT DATA PREPARATION                             ');
         gotoxy(1,11);
         textcolor(lightgreen);
         textbackground(black);
         write('Enter airport IATA code: ');
         gotoxy(1,13);
         write('Enter the season for generating SCR message(s) (S20/W20): ');
         gotoxy(1,15);
         write('Enter the date of origin SCR message(s) (DDMMM): ');
         gotoxy(1,17);
         write('Enter the date of generating of Slots Requests (DDMMM): ');
         gotoxy(1,19);
         write('Enter the number of generating flight(s): ');
         gotoxy(1,21);
         write('Enter the middle value of Load Factor: ');
         gotoxy(1,23);
         write('Enter the value of diffusion for Load Factor: ');

         textcolor(white);
         gotoxy(26,11);
         readln(iata_code);
         gotoxy(59,13);
         readln(season);
         gotoxy(50,15);
         readln(date_request);
         gotoxy(57,17);
         readln(date_scr);
         gotoxy(43,19);
         readln(flight_number);
         gotoxy(40,21);
         readln(load_factor);
         gotoxy(47,23);
         readln(diffusion);
         a:=load_factor-diffusion;
         b:=load_factor+diffusion;
         normvideo;
      end;

      if key='2' then
      begin
         clrscr;
         randomize;
         textcolor(white);
         writeln('SCR');
         writeln(season);
         writeln(date_request);
         writeln(iata_code);

         for i:=1 to flight_number do
         begin
            ac[i]:=random(act)+1;
            CI[i]:=random(144)+1;
            arrival_h:=(CI[i]*10) div 60;
            arrival_m:=(CI[i]*10)-(arrival_h*60);
            departure_h:=((CI[i]+5)*10) div 60;
            departure_m:=((CI[i]+5)*10)-(departure_h*60);

            if ac[i]=1 then name:=seat_cap1_s+'B735';
            if ac[i]=2 then name:=seat_cap2_s+'A320';
            if ac[i]=3 then name:=seat_cap3_s+'B738';
            if ac[i]=4 then name:=seat_cap4_s+'B752';
            if ac[i]=5 then name:=seat_cap5_s+'A321';
            if ac[i]=6 then name:=seat_cap6_s+'B753';
            if ac[i]=7 then name:=seat_cap7_s+'A310';
            if ac[i]=8 then name:=seat_cap8_s+'A330';

            if i<10 then
            begin
               write('N FLT0',i,' ');
            end;

            if i>9 then
            begin
               write('N FLT',i,' ');
            end;

            if arrival_h>9 then
            begin
               if arrival_m>0 then
               begin
                  write(date_SCR,date_SCR,' ',name,' ABC',arrival_h:2, arrival_m,' ');
                  if departure_h>9 then write(departure_h);
                  if departure_h<10 then write('0',departure_h);
                  if departure_m>0 then write(departure_m);
                  if departure_m=0 then write(departure_m,'0');
                  writeln('ABC CC');
               end;

               if arrival_m=0 then
               begin
                  write(date_SCR,date_SCR,' ',name,' ABC',arrival_h:2, arrival_m,'0 ');
                  if departure_h>9 then write(departure_h);
                  if departure_h<10 then write('0',departure_h);
                  if departure_m>0 then write(departure_m);
                  if departure_m=0 then write(departure_m,'0');
                  writeln('ABC CC');
               end;
            end;

            if arrival_h<10 then
            begin
               if arrival_m>0 then
               begin
                  write(date_SCR,date_SCR,' ',name,' ABC','0',arrival_h, arrival_m,' ');
                  if departure_h>9 then write(departure_h);
                  if departure_h<10 then write('0',departure_h);
                  if departure_m>0 then write(departure_m);
                  if departure_m=0 then write(departure_m,'0');
                  writeln('ABC CC');
               end;

               if arrival_m=0 then
               begin
                  write(date_SCR,date_SCR,' ',name,' ABC','0',arrival_h, arrival_m,'0 ');
                  if departure_h>9 then write(departure_h);
                  if departure_h<10 then write('0',departure_h);
                  if departure_m>0 then write(departure_m);
                  if departure_m=0 then write(departure_m,'0');
                  writeln('ABC CC');
               end;
            end;
         end;
         readln;
         normvideo;
      end;

      if key='3' then
      begin
         clrscr;
         randomize;
         assign(f,'data.txt');
         rewrite(f);

         textcolor(yellow);
         textbackground(blue);
         write('                            AIRPORT DATA GENERATING                             ');
         textbackground(black);
         writeln;
         textcolor(lightgreen);
         writeln('FLT_Nr   A/C    L_F   PAX   STA     STD');
         writeln(f,'FLT_Nr   A/C    L_F   PAX   STA    STD');

         for i:=1 to flight_number do
         begin
            x[i]:=random(b-a)+a;
            ac[i]:=random(act)+1;
            CI[i]:=random(139)+1;
            arrival_h:=(CI[i]*10) div 60;
            arrival_m:=(CI[i]*10)-(arrival_h*60);
            departure_h:=((CI[i]+5)*10) div 60;
            departure_m:=((CI[i]+5)*10)-(departure_h*60);

            if ac[i]=1 then
            begin
               types:='B735';
               PAX[i]:=round((seat_cap1/100)*x[i]);
            end;

            if ac[i]=2 then
            begin
               types:='A320';
               PAX[i]:=round((seat_cap2/100)*x[i]);
            end;

            if ac[i]=3 then
            begin
               types:='B738';
               PAX[i]:=round((seat_cap3/100)*x[i]);
            end;

            if ac[i]=4 then
            begin
               types:='B752';
               PAX[i]:=round((seat_cap4/100)*x[i]);
            end;

            if ac[i]=5 then
            begin
               types:='A321';
               PAX[i]:=round((seat_cap5/100)*x[i]);
            end;

            if ac[i]=6 then
            begin
               types:='B753';
               PAX[i]:=round((seat_cap6/100)*x[i]);
            end;

            if ac[i]=7 then
            begin
               types:='A310';
               PAX[i]:=round((seat_cap7/100)*x[i]);
            end;

            if ac[i]=8 then
            begin
               types:='A330';
               PAX[i]:=round((seat_cap8/100)*x[i]);
            end;

            textcolor(white);
            if (arrival_m=0) and (departure_m=0) then
            begin
               write('FLT ',i:2,'   ',types:4,'  ',x[i]:3,'%   ',PAX[i]:3,'   ',arrival_h:2);
               writeln(':',arrival_m,'0   ',departure_h:2,':',departure_m,'0');
               write(f,'FLT ',i:2,'   ',types:4,'  ',x[i]:3,'%   ',PAX[i]:3,'   ',arrival_h:2);
               writeln(f,':',arrival_m,'0   ',departure_h:2,':',departure_m,'0');
            end;

            if (arrival_m=0) and (departure_m>0) then
            begin
               write('FLT ',i:2,'   ',types:4,'  ',x[i]:3,'%   ',PAX[i]:3,'   ',arrival_h:2);
               writeln(':',arrival_m,'0   ',departure_h:2,':',departure_m);
               write(f,'FLT ',i:2,'   ',types:4,'  ',x[i]:3,'%   ',PAX[i]:3,'   ',arrival_h:2);
               writeln(f,':',arrival_m,'0   ',departure_h:2,':',departure_m);
            end;

            if (arrival_m>0) and (departure_m=0) then
            begin
               write('FLT ',i:2,'   ',types:4,'  ',x[i]:3,'%   ',PAX[i]:3,'   ',arrival_h:2);
               writeln(':',arrival_m,'   ',departure_h:2,':',departure_m,'0');
               write(f,'FLT ',i:2,'   ',types:4,'  ',x[i]:3,'%   ',PAX[i]:3,'   ',arrival_h:2);
               writeln(f,':',arrival_m,'   ',departure_h:2,':',departure_m,'0');
            end;
            if (arrival_m>0) and (departure_m>0) then
            begin
               write('FLT ',i:2,'   ',types:4,'  ',x[i]:3,'%   ',PAX[i]:3,'   ',arrival_h:2);
               writeln(':',arrival_m,'   ',departure_h:2,':',departure_m);
               write(f,'FLT ',i:2,'   ',types:4,'  ',x[i]:3,'%   ',PAX[i]:3,'   ',arrival_h:2);
               writeln(f,':',arrival_m,'   ',departure_h:2,':',departure_m);
            end;
         end;
         close(f);
         readln;
         normvideo;
      end;


   until key='E';
end.