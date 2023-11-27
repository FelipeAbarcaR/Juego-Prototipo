/// @description Insert description here
// You can write your code in this editor

var _dir = point_direction(x,y,target_x,target_y);

image_angle=_dir-90;

switch(state)
{
    case 0:
		sprite_index=spr_charging;
		if(image_index >= image_number-1)
		{
			state=1;
		}
		
		
	break;
	
	case 1:
		visible=false;
		image_alpha=0;
		if(global.beat)
		{
			image_alpha=1;
			image_index=0
		    visible=true;
			state=2;
		}
	break;
	
	case 2:
		sprite_index=spr_fire;
		doing_damage=true;
		if(image_index>=image_number-1)
		{
			fire_started=true;
			image_index=fire_frame_repeat;
		}
		if(fire_started)
		{
			fire_started=false;
			alarm[0]=fire_time*room_speed;
		}
	break;
	
	case 3:
	image_xscale-=0.1;
	if(image_index>=image_number-1) image_index=fire_frame_repeat;
	if(image_xscale<=0)
	{
		instance_destroy();
	}
	break;
}