/// @description Insert description here
// You can write your code in this editor

enum BG_STATES
{
    FADEIN,
	MOVING,
	STATIC,
	FADEOUT	
}

enum BG_MOVING_TYPE
{
    LEFT,
	RIGHT,
}

images=[-1];

switch (room)
{
    case roomMapaInicial:
	
		images=[
			spr_BG_M0_03_original,
			spr_BG_M0_02_original
		];
	break;
	
	case roomMapa1Talo:
			images=[
			spr_BG_M0_03_original,
			spr_BG_M0_02_original
		];
	break;
	
	default:
	show_debug_message("obj_background_landscape: no existen fotitos de para mostrar de este room");
	instance_destroy();
	break;
}

bg_current_image_index=0;

bg_state=BG_STATES.FADEIN;

fading=false;
moving= false;

bg_image_width=672;
bg_image_height=378;
bg_image_scale=1.3;

bg_x_offset=0;
bg_y_offset=126;

bg_moving_speed=0.7;

bg_transition=-1;
bg_surface=-1;

//uc_bars(true,0.15);

bg_view_x=uc_get_view_x();
bg_view_y=uc_get_view_y();

bg_x=0;
bg_y=0;


fixed_background=false;