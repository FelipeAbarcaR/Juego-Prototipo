/// @description Insert description here
// You can write your code in this editor

state=states.IDLE;
jump_hspeed=8;
roll_hspeed=6;
crouch_z=20;
animation_time=100;
delay_time=20;

inputmagnitude=0;

idle_sprite=spr_obs_gato;
roll_sprite=spr_gato3_roll_right_1;
jump_sprite=spr_gato3_idle;
crouch_sprite=spr_gato3_roll_down_1;

gravedad=2;
acc_gravedad=0.07;

invulnerable=false;
invulnerable_delay=1;
got_hit=false;

//shader
	//red flash hit
	current_flash=0.0;
	flash=0.5;
	sh_fhlash=shader_get_uniform(sha_red_flash,"flash");
	x1=0; //to use in draw