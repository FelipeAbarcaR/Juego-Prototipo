/// @description Insert description here
// You can write your code in this editor

if(RotationRemaining>0){
	Rotation+=RotationSpeed;
	RotationRemaining-=RotationSpeed;
}

draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	Rotation,
	image_blend,
	image_alpha
	)