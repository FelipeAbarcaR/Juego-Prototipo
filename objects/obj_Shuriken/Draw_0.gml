/// @description Insert description here
// You can write your code in this editor

if(RotationRemaining>0){
	Rotation+=RotationSpeed;
	RotationRemaining-=RotationSpeed;
}

//if (state =="move")
//{
//	shader_set(sha_white_outline);	
//	var _texture = sprite_get_texture(sprite_index,image_index);
//	var _texture_width = texture_get_width(_texture);
//    var _texture_height = texture_get_height(_texture);
//	shader_set_uniform_f(sh_texture,_texture_width,_texture_height);
//}
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
	);
	
	//if (shader_current() !=-1) shader_reset();