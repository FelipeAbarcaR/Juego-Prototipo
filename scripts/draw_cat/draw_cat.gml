// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_cat(){
	draw_sprite(spr_shadow,0,x,y+1); //Shadow
	
	draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y-z,
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha);
}