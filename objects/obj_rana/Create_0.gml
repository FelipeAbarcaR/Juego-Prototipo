/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

event_inherited();
if (RanaConejo) sprite_index=spr_ranaconejo;

//fighter=obj_fight_rana_TEST;
fighter=obj_fight_kirby_TEST170
fight_bg=spr_bg_forest2;

var _length =3

x1_check= x-(x mod TILE_SIZE)
y1_check= y+(TILE_SIZE - (y mod TILE_SIZE)) 
x2_check=x1_check+TILE_SIZE;
y2_check=y1_check+TILE_SIZE*_length;

detected=false;