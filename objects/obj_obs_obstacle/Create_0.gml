/// @description Insert description here
// You can write your code in this editor

//obs_type=-1;
obs_speed=obj_obs_control.obs_speed;
scale=3;
image_xscale=scale;
image_yscale=scale;

distance_active=false;
animated=false;
switch(obs_type)
{
    case obstacle.down:
		sprite_index=spr_spike;//spr_wood_spike//spr_obstacle_down;
		//var _extra=0.7;
		//image_xscale-= _extra;
		//image_yscale-= _extra;
		distance_active=true;
		break;
	
	case obstacle.up:
		sprite_index=spr_arrow_trap;//spr_obstacle_up;
		var _sprite_grid=32;
		var _grid_distance=4;
		var _offsety=16;
		y-=(_sprite_grid*_grid_distance)-_offsety;
		distance_active=true;
		break;
		
	case obstacle.updown:
		sprite_index=spr_fan2//spr_obstacle_updown
		instance_create_depth(x, y,depth, obj_obs_obstacle,{obs_type : obstacle.updown2});
		animated=true;
		break;
		
	case obstacle.updown2:
		sprite_index=spr_fan;
		var _sprite_grid=32;
		var _grid_distance=4;
		var _offsety=16;
		y-=(_sprite_grid*_grid_distance)-_offsety;
		animated=true;
	
	default:
		break;
}

