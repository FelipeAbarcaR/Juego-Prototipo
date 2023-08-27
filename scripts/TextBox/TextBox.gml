// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_blurry_background(_x,_y,_tb_width,_tb_height,_col= #566573){

	var _width=_tb_width;
	var _height=_tb_height;
	var _tb_x=_x;
	var _tb_y=_y;
	
	var _x_pos=camera_get_view_x(oCameraManager.camera)+_tb_x;
	var _y_pos=camera_get_view_y(oCameraManager.camera)+_tb_y;

	
	// Create a surface to store the blurred visuals	
	
	if (!surface_exists(surface_textbox)) {
		surface_textbox = surface_create(_width,_height);
		surface_copy_part(surface_textbox,0,0,application_surface,_tb_x,global.res.height - _height - _margin,_width,_height);
		show_debug_message("surface textbox created");
	}
	
	//	//draw

	var _circular_surface= -1;
	_circular_surface = surface_create(_width,_height);

	surface_set_target(_circular_surface);
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
	
            
    var radius = 0.005;
            
    shader_set(blurry_shader);
        shader_set_uniform_f(u_vRatio, vRatio);
        shader_set_uniform_f(u_threshold, radius * blurValue);
	
	if(surface_exists(_circular_surface)){
			
	draw_surface(_circular_surface,_x_pos,_y_pos);
	shader_reset();
		}
	surface_free(_circular_surface);
	
	draw_set_alpha(0.5);
	draw_roundrect_color_ext(_x_pos,_y_pos,_x_pos+_width,_y_pos+_height,_rounded,_rounded, _col , _col ,0);
	draw_set_alpha(1);
	
	if(global.DrawText)
	{
		draw_text(_x_pos,_y_pos-64+16,"BlurValue: "+string(blurValue));
		draw_text(_x_pos,_y_pos-64+32,"hola1: "+string(hola));
		draw_text(_x_pos,_y_pos-64+32+16,"hola2: "+string(hola2));
	
	}
	
}
function draw_blurry_background_gui(_x,_y,_tb_width,_tb_height,_col= #566573){

	var _width=_tb_width;
	var _height=_tb_height;
	var _tb_x=_x;
	var _tb_y=_y;
	var h_ratio=display_get_gui_height()/global.res.height;
	var w_ratio=display_get_gui_width()/global.res.width;

	if (!surface_exists(surface_textbox)) {
		surface_textbox = surface_create(_width,_height);
		surface_copy_part(surface_textbox,0,0,application_surface,_tb_x,global.res.height - _height,_width,_height);
		show_debug_message("surface textbox created");
	}
	
	//	//draw

	var _circular_surface= -1;
	_circular_surface = surface_create(_width/w_ratio,max(1,_height/h_ratio));

	surface_set_target(_circular_surface);
        gpu_set_blendenable(false)
        gpu_set_colorwriteenable(false,false,false,true);
        draw_set_alpha(0);
        draw_rectangle(0,0, _width/w_ratio,_height/h_ratio, false);

        draw_set_alpha(1);
        var _rounded = 15;
		draw_roundrect_ext(0, 0, _width/w_ratio, _height/h_ratio, _rounded, _rounded, 0);
        gpu_set_blendenable(true);
        gpu_set_colorwriteenable(true,true,true,true);
   
        gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
        gpu_set_alphatestenable(true);
		
		 var radius = 0.005;
            
		shader_set(blurry_shader);
        shader_set_uniform_f(u_vRatio, vRatio);
        shader_set_uniform_f(u_threshold, radius * blurValue);
		
		if(surface_exists(surface_textbox))
		{
		    draw_surface_part(surface_textbox,_x/w_ratio,_y/h_ratio,_width/w_ratio,_height/h_ratio,0,0);
		}

		shader_reset();
        gpu_set_alphatestenable(false);
        gpu_set_blendmode(bm_normal);  
		surface_reset_target();

	if(surface_exists(_circular_surface)){
			
	draw_surface_stretched(_circular_surface,_x,_y,_width,_height);
		}
	surface_free(_circular_surface);
	
	draw_set_alpha(0.5);
	draw_roundrect_color_ext(_x,_y,_x+_width,_y+_height,_rounded,_rounded, _col , _col ,0);
	draw_set_alpha(1);
	
}