/// @description Insert description here
// You can write your code in this editor

state=states.LOCK;
jump_hspeed=5.5;
roll_hspeed=4.5;
crouch_z=20.0	;
animation_time=100;
delay_time=20;

inputmagnitude=0;

idle_sprite=spr_obs_gato;
roll_sprite=spr_obs_gato_roll_right;
jump_sprite=spr_gato3_idle;
crouch_sprite=spr_obs_gato_roll_down;

gravedad_inicial=1.0;
gravedad=gravedad_inicial;
acc_gravedad=0.06;

invulnerable=false;
invulnerable_delay=1;
got_hit=false;

//shader
	//red flash hit
	current_flash=0.0;
	flash=0.5;
	sh_fhlash=shader_get_uniform(sha_red_flash,"flash");
	x1=0; //to use in draw
	
	hola=0;
	hola_g=0