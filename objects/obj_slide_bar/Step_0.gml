if(mouse_check_button_pressed(mb_left))
{
	var _button_x = x + sprite_width*zoom_value;
	var _button_y = y;
	var _button_radius = sprite_get_width(spr_slide_button)/2;
	
	if(point_in_circle(mouse_x,mouse_y,_button_x,_button_y,_button_radius))
	{
		selected = true;
	}
}

if(!mouse_check_button(mb_left))
{
	selected = false;	
}

if selected
{
	zoom_value = clamp((mouse_x - x)/sprite_width/2,-zoom_max_value,zoom_max_value);	
	
	global.zoom = zoom_value;
	
	

	

	
}