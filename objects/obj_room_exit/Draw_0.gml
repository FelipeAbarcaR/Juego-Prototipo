/// @description Insert description here
// You can write your code in this editor

var _imageyscale

_imageyscale=image_yscale;

if (global.beat==true)
{
    _imageyscale*=(-1)
}

draw_sprite_ext(
	spr_bush,
	0,
	x,
	y,
	image_xscale,
	_imageyscale,
	image_angle,
	image_blend,
	image_alpha
	);