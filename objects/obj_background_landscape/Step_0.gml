/// @description Insert description here
// You can write your code in this editor


if(!surface_exists(bg_surface))
{
	bg_surface	=	surface_create(bg_image_width,bg_image_height);
}

switch(bg_state)
{
    case BG_STATES.FADEIN:
	if(!fading)
	{
		bg_transition =	screen_transition(TR_TYPE.FADE,TR_WAY.OUT,true,c_white,undefined,0.5);
	    fading=true;
	}
	else
	{
		if(screen_transition_exists(bg_transition))
		{
		    var _progress = screen_transition_get_progress(bg_transition);
			show_debug_message("bg_transition: "+string(_progress))
		
			if (_progress==0.5)
			{
				alarm[0]=bg_time*room_speed;
			   bg_state	= BG_STATES.MOVING;
			}
		}
	}
	break;
	
	case BG_STATES.MOVING:
	
		bg_x_offset = clamp(bg_x_offset+bg_moving_speed,0,sprite_get_width(images[bg_current_image_index])-bg_image_width);
		
	break;
	
	case BG_STATES.STATIC:
	break;
	
	case BG_STATES.FADEOUT:
		if(screen_transition_exists(bg_transition))
		{
			screen_transition_destroy(bg_transition,true);
		}
		
		bg_alpha-=bg_alpha_speed;
		if(bg_alpha<=0)
		{
			instance_destroy();
		}
	
	break;
	 
}
if(keyboard_check_pressed(vk_space))
{
    fixed_background=true;
	o_player.state=states.IDLE;
	instance_destroy();
}


//blquear al gato
if(instance_exists(o_player))
{
     //o_player.state=states.LOCK;
}
if(!fixed_background)
{
	bg_view_x=uc_get_view_x();
	bg_view_y=uc_get_view_y();
}



