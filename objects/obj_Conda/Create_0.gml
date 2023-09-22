/// @description configs
randomize();
StartEndState=false;
image_speed = 0;
global.enemy_hit = true; //true: enemy can be hit
global.enemy_atk = false; //true:enemy can do damage
global.enemy_hurt = false; //true: enemy got hurt


//screen
guiheight=display_get_gui_height();
guiwidth=display_get_gui_width();

//attack & gettin hit options

time_attack = round(random_range(3,4));
attack_delay=0.5; //seconds to wait to start counting to attack
hurt_delay=0.5;
collided=false;

//stance parameters
stance = EnemyStance.locked;
state="idle"; //state para script fightrhythmanimate
bits=3; //beats para pasar de idle a prepare
bits2=3; //beats para pasar de prepare a attack
bitcount=0;
ataque=-1
xi=x;
yi=y;

//Stats
hp=100;
hpmax=hp;
DMG = 20;

// path sets
point_to_go=0;
on_point=false;
move_on_path = false;
attacking =false;
current_beat=0;
current_path = 0;
spd = 16;
endaction =	0;
absolute = 0;

//sprites
last_sprite=0;

spr_atk1=spr_CondaATK1;
spr_atk2=spr_CondaATK2;
spr_atk3=spr_CondaATK3;
spr_atk4=spr_CondaATK4;
spr_dead=spr_CondaDead;
spr_hurt=spr_CondaHurt;
spr_idle=spr_CondaIdle;

//SFX
sfx_prepare=array_create(3,-1)
sfx_index=0; //for playsfx()

sfx_prepare[0]=sfx_prepare1;
sfx_prepare[1]=sfx_prepare2;
sfx_prepare[2]=sfx_prepare3;
played_sfx=false; //actually used in scr_fightenemymove

//shader
	//red flash hit
	start_flash1=false;
	current_flash=0.0;
	flash=0.5;
	sh_fhlash=shader_get_uniform(sha_red_flash,"flash");
	x1=0; //to use in draw
	
	//white outline
	sh_texture=shader_get_uniform(sha_white_outline,"texture_Pixel");

//hp2 animation (obj_control_fight)
draw_hp2=false;
//music settings
bgm=bgm_Feelings;
bpm=115;