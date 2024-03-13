/// @description 


event_inherited();
walk_spd = 1.7;
initial_walk_spd=walk_spd;
diag_walk_spd = floor(walk_spd*(sqr(2)/2));
walk_friction=0;
hp_max = 10;
hp = hp_max;
dir = 270;

//en un futuro
can_attack = true;

//Habilidades
global.CanDash=false;
//global.CanShield=false;
//global.Can3Tempo=false;

global.end_interaction = -1;
entity_target =-1;


//Groovy parameters (when the player is in the groove)
groovy_speed_increase=0.6;
groovy_speed_roll_increase=0.2;
groovy_distance_roll_increase=0.4;

ready_to_restart = false; //ensures we can restart after death animation

speedroll = 3.5;
initial_speed_roll=speedroll;
distanceroll = 80;
distancerollheight = 9;

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
	
	//roll
	spr_roll = spr_player_roll;
	
//sound
path_id = -1;


//SHADERS
sha_alpha = 0.5;

	//red flash shader (if the gato get hurts)
	start_flash=false;
	current_flash=0.0;
	flash=0.5;
	sh_fhlash=shader_get_uniform(sha_red_flash,"flash");
	x1=0; //to use in draw
	red_flashing=false;

	//rainbow shader

	shdrRainbow= shader_set_rainbow();
	

//AUTOMOVE STATE PARAMETERS

automove_from_activate=false;
automove_x=-1;
automove_y=-1;

//HIT EFFECT PARAMETERS

damaged				=	false;
inmunity			=	false;
hit_inmunity_time	=	1.6; //time in seconds of no receveing damage when the gato get hit;

	//blink effect (or strobe effect, idk)
	time_showing_sprite		=	0.08;
	time_showing_nothing	=	0.03;
	time_to_wait			=	time_showing_sprite;
	blinking_delta_time		=	0;
	
//PARTICLES EFFECTS

rainbow_particle=part_system_create(particle_notes);
part_system_depth(rainbow_particle,depth-1);

button_shield=false;



//npc follow
pos_array_size = 94;

for(var i = pos_array_size -1; i >= 0; i--)
{
	pos_x[i] = x;
	pos_y[i] = y;
	
	to_record_sprite[i] = spr_gato3_down;
	to_record_xscale[i] = image_xscale;
}