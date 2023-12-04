/// @description Insert description here
// You can write your code in this editor
event_inherited();

doing_damage=false;
target_x=0;
target_y=0;
depth=depth+2;

state = 0


//states
/*
	0=charging
	1=waiting
	2=fire
	3=dessapearing
*/



spr_charging=spr_beam_testo;
spr_fire = spr_beam_testo_pt2;

fire_frame_repeat=  4;
fire_time=0.3;
fire_started=false;
