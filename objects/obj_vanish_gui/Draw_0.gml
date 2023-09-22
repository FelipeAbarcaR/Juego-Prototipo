/// @description Insert description here
// You can write your code in this editor

if(!draw_on_gui)
{
	var _color;
	if(sprite_color!=-1)_color=sprite_color else _color=image_blend;
    draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	_color,
	image_alpha
	)
}