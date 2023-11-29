/// @description Insert description here
// You can write your code in this editor

//black background
var _w=480*2;
var _h=270*2;
var _x=bg_view_x-_w/2;
var _y=bg_view_y-_w/2;
draw_rectangle_color(_x,_y,_x+_w,_y+_h,c_black,c_black,c_black,c_black,false);

if(surface_exists(bg_surface))
{
	
	var _sprite_name=sprite_get_name(images[bg_current_image_index]);
    surface_set_target(bg_surface);
	draw_sprite_part(images[bg_current_image_index],image_index,bg_x+bg_x_offset,bg_y+bg_y_offset,bg_image_width,bg_image_height,0,0);
	surface_reset_target();
	
	draw_surface_stretched(bg_surface,bg_view_x,bg_view_y, uc_get_view_width(),uc_get_view_height());
	draw_circle(bg_view_x,bg_view_y,20,false);
	
}

