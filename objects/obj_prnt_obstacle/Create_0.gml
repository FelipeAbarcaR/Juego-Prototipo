/// @description Insert description here
// You can write your code in this editor

//obs_type=-1;
obs_speed=obj_obs_control.obs_speed;

switch(obs_type)
{
    case obstacle.down:
		sprite_index=spr_obstacle_down;
	break;
	
	case obstacle.up:
		sprite_index=spr_obstacle_up;
		y-=80;
	break;
	
	default:
	break;
}

