var _width = global.res.width;
var _height = global.res.height;



if(!already_fighting)
{
	if (!surface_exists(surface_textbox)) {
		surface_textbox = surface_create(_width,_height);
		surface_copy(surface_textbox,0,0,application_surface);
		show_debug_message("surface textbox created");
	}
}
//if (!already_fighting)
//{
//	draw_blurry_background(_x,_y,_width,_height,#919191);
//}