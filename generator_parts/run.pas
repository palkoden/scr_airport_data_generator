
{
    Constructor of the initial page of the generator.
}

program run;

begin
  Gd := detect;
  InitGraph(Gd, Gm, '');
  
  if GraphResult <> grOk then
    Halt(1); { Should malfunction in graph initialization be detected, the program will close itself. }
  
  setfillstyle(1, 8);
  bar(0, 0, 639, 479);
  setfillstyle(1, 1);
  bar(0, 10, 639, 45);
  setcolor(14);
  settextstyle(0, 0, 2);

  outtextxy(152, 20, 'SCR AND PAX GENERATOR');
  setcolor(11);

  outtextxy(250, 110, 'Main Menu');
  setfillstyle(1, 0);
  bar(149, 189, 251, 291);
  bar(269, 189, 371, 291);
  bar(389, 189, 491, 291);
  bar(509, 399, 611, 451);
  setfillstyle(1, 15);
  bar(150, 190, 250, 290);
  bar(270, 190, 370, 290);
  bar(390, 190, 490, 290);
  bar(510, 400, 610, 450);
  setcolor(4);
  settextstyle(0, 0, 0);
  outtextxy(240, 200, '1');
  setcolor(1);

  outtextxy(161, 230, 'Input Data');

  outtextxy(157, 250, 'Preparation');
  setcolor(4);
  outtextxy(360, 200, '2');
  setcolor(1);

  outtextxy(290, 230, 'SCR Data');

  outtextxy(281, 250, 'Generating');
  setcolor(4);
  outtextxy(480, 200, '3');
  setcolor(1);

  outtextxy(393, 230, 'Airport Data');

  outtextxy(402, 250, 'Generating');

  setcolor(4);
  outtextxy(600, 410, 'E');

  setcolor(1);
  outtextxy(547, 425, 'Exit');
  
  closegraph;
end