/// @description 
event_inherited();
walk_spd = 2;
diag_walk_spd = floor(walk_spd*(sqr(2)/2));
hp_max = 10;
hp = hp_max;
dir = 270;

//en un futuro
can_attack = true;

//Habilidades
global.CanDash=false;
//global.CanShield=false;
//global.Can3Tempo=false;


ready_to_restart = false; //ensures we can restart after death animation

speedroll = 3.0;
distanceroll = 70;
distancerollheight = 12;
z = 0;
x_dest = -1;
y_dest = -1;

script_start = false;

//sprites
	//moving
	spr_move_right		= spr_gato3_right;
	spr_move_right_up	= spr_gato3_right_up;
	spr_move_up			= spr_gato3_up;
	spr_move_left_up	= spr_gato3_left_up;
	spr_move_left		= spr_gato3_left;
	spr_move_left_down	= spr_gato3_left_down;
	spr_move_down		= spr_gato3_down;
	spr_move_down_right	= spr_gato3_down_right;
	
	//idle
	spr_player_idle = spr_gato3_idle;
	
//sound
path_id = -1;

//Shaders
sha_alpha = 0.5;

	
