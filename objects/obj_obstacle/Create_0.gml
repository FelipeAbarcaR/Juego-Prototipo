/// @description Insert description here
// You can write your code in this editor

//obs_type=-1;
obs_speed=obj_obs_control.obs_speed;
scale=1.3;
image_xscale=scale;
image_yscale=scale;
switch(obs_type)
{
    case obstacle.down:
		sprite_index=spr_obstacle_down;
		var _extra=0.2
		image_xscale=scale + _extra;
		image_yscale=scale + _extra;
		break;
	
	case obstacle.up:
		sprite_index=spr_obstacle_up;
		y+=30;
		break;
	case obstacle.updown:
		sprite_index=spr_obstacle_updown
		break;
	
	default:
		break;
}

