/// @description Insert description here
// You can write your code in this editor



show_debug_message("click");
if keyboard_check(vk_control)
{

	var _is_visible=layer_get_visible(lay_id);

	if(_is_visible)
	{
	    layer_set_visible("DarkEffect",false);
	}else     layer_set_visible("DarkEffect",true);
	show_debug_message("activado (?)")
}


if keyboard_check(mouse_check_button(mb_any))
{
	show_debug_message("obj_light_tester: creado luz de cono")

	var _is_visible=layer_get_visible(lay_id);

	///SendFX(spr_lightcone,mouse_x,mouse_y)

	var _obj=instance_create_layer(mouse_x,mouse_y,lay_id,obj_vanish,{image_xscale:0.06,image_yscale:0.2,image_angle:random(1)*360})
	_obj.sprite_index=spr_lightcone;
}


	surface_set_target(dark_surface);
        gpu_set_blendenable(false)
        gpu_set_colorwriteenable(false,false,false,true);
        draw_set_alpha(0);
        draw_rectangle(0,0, _width,_height, false);

        draw_set_alpha(1);
        var _rounded = 15;
		
		draw_roundrect_ext(0, 0, _width, _height, _rounded, _rounded, 0);
        gpu_set_blendenable(true);
        gpu_set_colorwriteenable(true,true,true,true);
   
        gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
        gpu_set_alphatestenable(true);
		
        draw_surface(surface_textbox,0,0);
        gpu_set_alphatestenable(false);
        gpu_set_blendmode(bm_normal);  
     surface_reset_target();