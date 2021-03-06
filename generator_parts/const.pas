 
{  
   Const file contains a declaration of constants and dependencies, used in the generator:
    - dependencies: ctr, graph units
    - type definitions of variables: 
        - gm, gd, key, a, b, i, flight_number etc
    - definition of constants: act, seat_capx_s:string, seat_capx:integer
}  

uses crt, graph;
var	gm, gd: integer;
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

{ Seating capacity for aircraft - bound to specific aircraft in scr_generators.pas }
const 	act=8;
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
