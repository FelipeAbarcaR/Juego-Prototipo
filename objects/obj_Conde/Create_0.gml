/// @description Insert description here
// You can write your code in this edit

x_to=x;
y_to=y;
attack_distance=140;
dodge_distance=60;
dodge_speed=16;
move=true;
state="locked";
inputmagnitude=0;
attack_collision=false;

//DELAYS
delay=0;
start_delay=false;
hit_delay=0.8;
attack_delay=0.4;
dodge_delay=0.5;
back_dodge_delay=0.8;

image_speed=0;
image_index=0;


hp=100;
hpmax=hp;
DMG=10;
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
	
fx_atk1=spr_fx_fight_atk1222;


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

Izquierda=0;
Derecha=0;
Arriba=0;
Abajo=0;
skill_2=0

initial_x_scale=image_xscale;
initial_y_scale=image_yscale;

//3tempo parameter
tempo_counter=0;
tempo_counter_max=3;
tempo_starting_beat=0;
tempo_beat=0;
tempo_shake_sounds=[sfx_shake1,sfx_shake2,sfx_shake3]
tempo_attack_sprites=[spr_fx_small_slash_1,spr_fx_small_slash_2,spr_fx_small_slash_3];