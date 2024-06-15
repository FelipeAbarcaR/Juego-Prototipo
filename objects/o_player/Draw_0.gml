//red flash shader if got hit

if(global.groovy)
{
	set_rainbow_shader();
}

if(start_flash)
{
	x1+=0.1
    current_flash=max(sin(x1)*flash,0);
	if (current_flash<=0)
	{
		start_flash=false;
		x1=0;
		current_flash=0;
	}else{
		shader_set(sha_red_flash);
		shader_set_uniform_f(sh_fhlash,current_flash);
	}	
}

if alarm[hurrtt] > 0 and flash-- < flash_initial/2 {
	
	//draw white sprite
	gpu_set_fog(1, c_white, 0, 1);
	draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, c_white, image_alpha);	
	gpu_set_fog(0, c_white, 0, 1);
	
	//reset flash
	if flash <= 0 flash = flash_initial;	
} else {
	if(inmunity)
	{
		if(time_to_wait==time_showing_sprite)
		{
			draw_cat();	
		}
		
		if(blinking_delta_time>=time_to_wait)
		{
			blinking_delta_time=0;
			//switch between time showing the sprite or not
		    if(time_to_wait==time_showing_sprite)
			{
				time_to_wait=time_showing_nothing
			} else 
			{
			    time_to_wait=time_showing_sprite;
			}
		}
	}else draw_cat();
}

shader_reset();

show_healthbar();

if(global.DrawText)
{
    draw_sprite_bbox();
	draw_activate_region();
	
}
//light in shadow
var _x=x-uc_get_view_x();
var _y=y-uc_get_view_y();

//LUZ DEL PLAYER
with(obj_light_tester)
{
    if (surface_exists(dark_surface)) {
	surface_set_target(dark_surface)
    gpu_set_blendmode(bm_subtract);
    draw_sprite_ext(spr_flashlight, 0, _x,_y-5,1,1,0,c_white,1);
    gpu_set_blendmode(bm_normal);
	surface_reset_target();
	}
}