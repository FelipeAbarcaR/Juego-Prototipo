// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Crypt_jump_animate(){
	
	var _dir=InputDirection;
	
	switch(_dir)
	{
	    case 0:
			sprite_index=spr_jump_right;
		break;
		
	    case 90:
			sprite_index=spr_jump_up;
		break;		

	    case 180:
			sprite_index=spr_jump_left;
		break;
		
	    case 270:
			sprite_index=spr_jump_down;
		break;
		
		default:
		show_debug_message("obj_crypt_player: no se encuentra direccion: "+string(_dir));
	}
	
	image_index=round(map_value(DistanceRemaining/GridDistance,0,1,0,sprite_get_number(sprite_index)-1));
	
}