/// @description Deactivate outside view

//Check whether any part of instance is in the view area
if(bbox_right >= global.viewXstart && bbox_bottom >= global.viewYstart && bbox_left <= global.viewXend && bbox_top <= global.viewYend)
{
	//in view
	if(!visible)
	{
		visible = true;
		Update_layers();
	}
	alarm[11] = room_speed*2;
}
else
{
	//outside the view
	visible = false;
	alarm[11] = 4;//el doble de la velocidad del player
	
}

