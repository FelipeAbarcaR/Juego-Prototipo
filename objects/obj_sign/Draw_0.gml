/// @description Insert description here
// You can write your code in this editor

event_inherited();

// draw shadow
var _signscale =1.2;
draw_sprite_ext(
	spr_shadow,
	0,
	x,
	y-1,
	_signscale,
	_signscale,
	image_angle,
	image_blend,
	image_alpha);



