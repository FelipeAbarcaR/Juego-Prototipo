/// @description Insert description here
// You can write your code in this editor

//Movement
GridSpeed=1;
GridDistance=16;
GridJumpHeight=10;
DistanceRemaining=0;


LastDirection=0;

//Stats
HP=100;
damaged=false;

state="wait"

//misc
texto="nada"/*draw*/
z=0;
Direction=0;

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
