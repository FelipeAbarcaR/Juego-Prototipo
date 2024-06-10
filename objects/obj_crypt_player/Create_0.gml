/// @description Insert description here
// You can write your code in this editor

//Movement
GridSpeed=1;
GridDistance=16;
GridJumpHeight=10;
DistanceRemaining=0;

GridRollSpeed=1.1;
GridRollHeight=7;
GridRollDistance=GridDistance*2;

LastDirection=0;

key_direction_pressed=false;

//Stats
HP=100;
damaged=false;

state="locked"

//misc
texto="nada"/*draw*/
z=0;
Direction=0;
sliding=false;

inmunity=false;
hit_inmunity_time=1.6; //time in seconds of no receveing damage when the gato get hit;

//set the point of where it started jumping
x_from=x;
y_from=y;			

//HIT EFFECT PARAMETERS
//blink effect (or strobe effect, idk)
time_showing_sprite=0.08;
time_showing_nothing=0.03;
time_to_wait=time_showing_sprite;
blinking_delta_time=0;

//draw sprite's function
draw_with_z=function()
			{
				draw_sprite_ext(
				sprite_index,
				image_index,
				x,
				y-z,
				image_xscale,
				image_yscale,
				image_angle,
				image_blend,
				image_alpha
				)
			}
//shader
start_flash=false;
current_flash=0.0;
flash=0.5;
sh_fhlash=shader_get_uniform(sha_red_flash,"flash");
x1=0; //to use in draw
red_flashing=false;

//SPRITES

spr_wait=spr_gato3_idle;
spr_move=spr_gato3_idle;
spr_roll=spr_gato_crypt_roll;
spr_jump_up=spr_gato_crypt_jump_up;
spr_jump_down=spr_gato_crypt_jump_down;
spr_jump_left=spr_gato_crypt_jump_left;
spr_jump_right=spr_gato_crypt_jump_right;

//SFX
sound_jump=sfx_tambourine//sfx_gato_jump;
sound_bump=sfx_bump;
sound_hit=sfx_crypt_hit;

hit_screen_frames_total=5;
hit_screen_frames=0;

//SPELLS
tempo_beat=0;
tempo_speed=6;
tempo_count=0;
tempo_wait=false;
tempo_sound=[sfx_shake1,sfx_shake2,sfx_shake3];
