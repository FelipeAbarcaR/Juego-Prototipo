/// @description Insert description here
// You can write your code in this edit

x_to=x;
y_to=y;
attack_distance=300;
dodge_distance=192;
dodge_speed=16;
move=true;
state="idle"
inputmagnitude=0;
attack_collision=false;

//DELAYS
delay=0;
start_delay=false;
hit_delay=0.8;
attack_delay=0.4;
dodge_delay=0.3;
back_dodge_delay=1.2;


image_speed=0;
image_index=0;


hp=100;
hpmax=hp;
DMG=31;
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


//SFX
sfx_ataque=sfx_ataque_espada;
sfx_dodge=sfx_dodge1;
sfx_hurt=sfx_hurt1;


//shader
start_flash=false;
current_flash=0.0;
flash=0.5;
sh_fhlash=shader_get_uniform(sha_red_flash,"flash");
x1=0; //to use in draw

hola=1;

//2nd bar decrease animation
draw_hp2=false;


