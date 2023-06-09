/// @description init grid and layers

//Set the cell size based on slowestr mover speed (POW 2)
global.CELL = 2;

//Set the grid height
global.GRID_H = room_height div global.CELL 

//Create the grid
global.layergrid = ds_grid_create(1,global.GRID_H)

//Create the layers ans assign them ot a grid cell
for (var i = 0; i < global.GRID_H; i++)
{
	global.layergrid[# 0,i] = layer_create(layer_get_depth("Sort_begin") - i);
}

//Extra space around the view
pixbuffer = 64;

//Get the view X Y
viewX = camera_get_view_x(view_camera[0]);
viewY = camera_get_view_y(view_camera[0]);

//Create the rectangle around the view
global.viewXstart = max(viewX - pixbuffer, 0);
global.viewYstart = max(viewY - pixbuffer, 0);
global.viewXend = min(viewX + pixbuffer + camera_get_view_width(view_camera[0]),room_width);
global.viewYend = min(viewY + pixbuffer + camera_get_view_height(view_camera[0]),room_height);

//Get the view last position
viewXlast = viewX;
viewYlast = viewY;




