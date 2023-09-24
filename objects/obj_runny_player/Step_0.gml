/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

switch(state)
{
	default:
	if hmove != 0 or vmove != 0
	{
		switch(dir)
		{
				case 0: sprite_index =		spr_move_down_right;	break;			
				case 45: sprite_index =		spr_move_right_up;		break;
				case 90: sprite_index =		spr_move_up;			break;	
				case 135: sprite_index =	spr_move_left_up;		break;
				case 180: sprite_index =	spr_move_left_down;		break;
				case 225: sprite_index =	spr_move_left_down;		break;
				case 270: sprite_index =	spr_move_down;			break;
				case 315: sprite_index =	spr_move_down_right;	break; 
		}
	} else
	{
		sprite_index=spr_move_down;
		image_index=(get_timer()/(1000000))*9;
		
	}
	if(table_cat)image_index=0;
	break;
	
	case states.ROLL:
	var _sprite=spr_roll;
	if(table_cat)_sprite=spr_player_idle;
	sprite_index = _sprite;
	if(table_cat)image_index=6;
	break;	
}
