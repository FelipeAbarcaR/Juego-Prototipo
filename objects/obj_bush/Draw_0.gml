/// @description Insert description here
// You can write your code in this editor

/// @description Cause Room transition
if(dancing_bush)
{
	if (global.beat==true)
	{
	    imagexscale*=(-1);
	}
}

draw_sprite_ext(
	spr_bush,
	0,
	x,
	y,
	imagexscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha);
	