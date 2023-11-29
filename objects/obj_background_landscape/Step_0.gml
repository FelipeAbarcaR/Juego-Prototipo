/// @description Insert description here
// You can write your code in this editor
if(!fixed_background)
{
	bg_view_x=uc_get_view_x();
	bg_view_y=uc_get_view_y();
}
switch(bg_state)
{
    case BG_STATES.FADEIN:
	
	if(!fading)
	{
		bg_transition =	screen_transition(TR_TYPE.FADE,TR_WAY.OUT,false,c_white,undefined,0.5);
	    fading=true;
	}
	else
	{
		if(screen_transition_exists(bg_transition))
		{
		    var _progress = screen_transition_get_progress(bg_transition);
			show_debug_message(_progress)
		
			if (_progress==1)
			{
			   bg_state	= BG_STATES.MOVING;
			   screen_transition_destroy(bg_transition,true);
			}
		}
	}
	break;
	
	case BG_STATES.MOVING:
		if(!surface_exists(bg_surface))
		{
		    bg_surface	=	surface_create(bg_image_width,bg_image_height);
		}
		
	break;
	
	case BG_STATES.STATIC:
	break;
	
	case BG_STATES.FADEOUT:
	break;
	 
}
if(keyboard_check_pressed(vk_space))
{
    fixed_background=true;
}

if(keyboard_check_pressed(vk_escape))
{
     instance_destroy();
}







