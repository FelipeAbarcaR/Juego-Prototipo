/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

//draw shadow
	draw_sprite(spr_shadow,0,x,y+1);
	
if(keyboard_check(ord("Ñ"))) draw_path(path,x,y,0);
/// @description 
if alarm[hurrtt] > 0 and flash-- < flash_initial/2 {
	
	//draw white sprite
	gpu_set_fog(1, c_white, 0, 1);
	draw_sprite_ext(sprite_index, image_index, x,floor(y-z), facing, 1, 0, c_white, image_alpha);	
	gpu_set_fog(0, c_white, 0, 1);
	
	
	//reset flash
	if flash <= 0 flash = flash_initial;	
	
} else {
	
	if state = states.ROLL
	{
	draw_sprite_ext(sprite_index, image_index, x,y-z,image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	else draw_sprite_ext(sprite_index, image_index, x,y, facing, 1, 0, c_white, image_alpha);

}

show_healthbar();


