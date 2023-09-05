if(mouse_check_button(mb_left) and instance_position(mouse_x,mouse_y,all) = id)
{
	slide_clicked = true;
}

if(slide_clicked == true)
{
	if(slide_bar_x >= slide_bar_pos_x and slide_bar_x <= slide_bar_pos_x + slide_bar_box_width)
	{
		slide_bar_x = mouse_x;	
	}
	
	if(slide_bar_x < slide_bar_pos_x)
	{
		slide_bar_x = slide_bar_pos_x;
	}
	
	if(slide_bar_x > slide_bar_pos_x + slide_bar_box_width)
	{
		slide_bar_x = slide_bar_pos_x + slide_bar_box_width;	
	}		
}

if(mouse_check_button_released(mb_left))
{
	slide_clicked = false;
	
	if(slide_percentage < 1)
	{	
		global.zoom = -slide_percentage;
	}
	else if(slide_percentage > 1)
	{
		global.zoom = slide_percentage;
	}
	else if (slide_percentage == 1)
	{
		global.zoom = 0;
	}
}

slide_percentage = 2*((slide_bar_x - slide_bar_pos_x)/slide_bar_box_width);
x = slide_bar_x;