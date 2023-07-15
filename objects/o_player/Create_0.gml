/// @description 
event_inherited();
walk_spd = 2;
hp_max = 10;
hp = hp_max;
dir = 270;

//en un futuro
can_attack = true;

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
	//spr_idle_right		=
	//spr_idle_right_up		=
	//spr_idle_up			=
	//spr_idle_left_up		=
	//spr_idle_left			=
	//spr_idle_left_down	=
	//spr_idle_down			=
	//spr_idle_down_right	=
