/// @description Insert description here
// You can write your code in this edit

x_to=x;
y_to=y;
attack_distance=350;
dodge_distance=192;
dodge_speed=16;
move=true;
state="idle"
inputmagnitude=0;

//DELAYS
start_delay=false;
hit_delay=0.8;
attack_delay=0.2;
dodge_delay=0.5;
back_dodge_delay=1.4;


image_speed=0;
image_index=0;


hp=100;
hpmax=hp;
DMG=34;
hpbar_width = 200;
hpbar_height = 24;
hpbar_x = 64;
hpbar_y = 32;
invincible=false;

//Sprites
	//player

spr_idle=spr_CondeIdle;
spr_atk1=spr_condeATK1;
spr_atk2=spr_CondeATK2;
spr_atk3=spr_CondeATK3;
spr_dead=spr_CondeDead;
spr_hurt=spr_CondeHurt;
	
	//FX
	
fx_atk1=spr_fx_fight_atk1;

debugswitch=true;

hola=1;