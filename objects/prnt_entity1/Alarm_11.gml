/// @description Deactivate outside view

//Check whether any part of instance is in the view area
if(bbox_right >= global.viewXstart && bbox_bottom >= global.viewYstart && bbox_left <= global.viewXend && bbox_top <= global.viewYend)
{
	//in view
}
else
{
	//outside the view
	instance_deactivate_object(id);
	
}

alarm[11] = room_speed * 2 //2 segundos