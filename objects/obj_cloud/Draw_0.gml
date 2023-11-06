/// @description Insert description here
// You can write your code in this editor
if(!surface_exists(shadow_surface))
{
    shadow_surface=surface_create(sprite_width,sprite_height);
}

//shader_set(sha_shadow)

//draw_sprite(sprite_index,image_index,x,y+100);

//shader_reset();

//var _fog=gpu_get_fog();
//var _shadow_fog=_fog;
//_shadow_fog[0]=true;
//_shadow_fog[1]=c_black;

gpu_set_fog(true,c_black,0,1);
var _scale=0.7;
var _distance=120;
var _dx=20;
var _alpha=0.25;
draw_sprite_ext(sprite_index,image_index,x+_dx,y+_distance,_scale,_scale,image_angle,image_blend,_alpha);
gpu_set_fog(0,c_white,0,0);
draw_self();