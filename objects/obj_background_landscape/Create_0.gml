/// @description Insert description here
// You can write your code in this editor
instance_destroy();
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
			spr_BG_M0_03_small,
			spr_BG_M0_04,
			spr_BG_M0_03_small,
			spr_BG_M0_02_original
		];
		
		bg_x_offset=0;
		bg_y_offset=83;
	break;
	
	case roomMapa1Talo:
		images=[
		spr_BG_M1_01_small,
		spr_BG_M0_03_original,
		spr_BG_M0_02_original
		];
		
		bg_x_offset=0;
		bg_y_offset=180;
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

bg_image_width=480//sprite_get_width(spr_BG_M0_03_original);
bg_image_height=270//sprite_get_height(spr_BG_M0_03_original);
bg_image_scale=1.3;

bg_moving_speed=0.65

bg_transition=-1;
bg_surface=-1;

bg_view_x=uc_get_view_x();
bg_view_y=uc_get_view_y();

bg_x=0;
bg_y=0;

bg_time=2.5;

bg_alpha=1;
bg_alpha_speed=0.01;


fixed_background=false;

//BARS
bars_enabled=1
bars_color=c_black
bars_percentage=0.08
bars_acceleration=1;
bars_height=uc_get_view_height()*bars_percentage;