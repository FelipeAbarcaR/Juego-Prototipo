/// @description Insert description here
// You can write your code in this editor

var _cam = oCameraManager
if (instance_exists(_cam))
{
    x=camera_get_view_x(_cam.camera);
	y=camera_get_view_y(_cam.camera);
	show_debug_message("hay cam,"+string(x)+", "+string(y))
}else
{
    x=0;
	y=0;
	show_debug_message("no hay cam :(");
	if(room==rm_GD)
	{
	    x=480;
	}
}

TransitionPlaceSequence(transition_type_in);
draw_background_patch=false;