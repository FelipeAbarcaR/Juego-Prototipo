//red flash shader if got hit
shader_set(shdrRainbow)
var uv = sprite_get_uvs(sprite_index, image_index);
shader_set_uniform_f(rainbow_uniUV, uv[0], uv[2]);
shader_set_uniform_f(rainbow_uniSpeed, rainbow_speed);
shader_set_uniform_f(rainbow_uniTime, rainbow_time);
shader_set_uniform_f(rainbow_uniSaturation, rainbow_saturation);
shader_set_uniform_f(rainbow_uniBrightness, rainbow_brightness);
shader_set_uniform_f(rainbow_uniSection, rainbow_section);
shader_set_uniform_f(rainbow_uniMix, rainbow_mix);
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
}