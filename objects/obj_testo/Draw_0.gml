// Create a surface to store the blurred visuals
	
	var _width=global.res.width*0.7;
	var _height=global.res.height*0.2;
	var _tb_x=(global.res.width-_width)/2;
	
if (!surface_exists(surface_textbox)) {
	surface_textbox = surface_create(_width,_height);
    surface_copy_part(surface_textbox,0,0,application_surface,_tb_x,global.res.height*0.7,_width,_height);
	show_debug_message("surface textbox created");
}


//// BLURRY EFFECT SHADER/SURFACE

	var _blur_steps = blur_steps;
	var _sigma= sigma;


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
	
	
	shader_set(blurry_shader);
		shader_set_uniform_f(u_blur_steps,_blur_steps);
		shader_set_uniform_f(u_texel_size,texel_w,texel_h);
		shader_set_uniform_f(u_sigma,_sigma);
	
	var _x_pos=camera_get_view_x(oCameraManager.camera)+_tb_x;
	var _y_pos=camera_get_view_y(oCameraManager.camera)+global.res.height*0.7;
	
	if(surface_exists(_circular_surface)){
			
	draw_surface(_circular_surface,_x_pos,_y_pos);	
	shader_reset();
		}
	surface_free(_circular_surface);
	
	draw_set_alpha(0.5);
	draw_roundrect_color_ext(_x_pos,_y_pos,_x_pos+_width,_y_pos+_height,_rounded,_rounded, #566573 , #566573 ,0);
	draw_set_alpha(1);
	
if(global.DrawText)
{
    draw_text(_x_pos,_y_pos-64,"Blur_steps: "+string(blur_steps));
	draw_text(_x_pos,_y_pos-64+16,"Sigma: "+string(sigma));
	
}
