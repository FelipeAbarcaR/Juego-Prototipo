/// @desc Update the view

//Get the view X Y
viewX = camera_get_view_x(view_camera[0]);
viewY = camera_get_view_y(view_camera[0]);

//Only update if we move
if(viewX != viewXlast || viewY != viewYlast)
{
	//Create the rectangle around the view
	global.viewXstart = max(viewX - pixbuffer, 0);
	global.viewYstart = max(viewY - pixbuffer, 0);
	global.viewXend = min(viewX + pixbuffer + camera_get_view_width(view_camera[0]),room_width);
	global.viewYend = min(viewY + pixbuffer + camera_get_view_height(view_camera[0]),room_height);
	
	//Activate an instances within the view
	instance_activate_region(global.viewXstart,global.viewYstart,global.viewXend,global.viewYend,true);

}
//Get the view last position
viewXlast = viewX;
viewYlast = viewY;

