/// @description Draw the pause surface

//Pause surface

if(pause && surface_exists(pause_surf))
{
	var _xscale = global.res.guiheight / surface_get_height(pause_surf)
	var _yscale = global.res.guiwidth / surface_get_width(pause_surf)
	draw_surface_ext(pause_surf,0,0,_xscale,_yscale,0,c_gray,1);
}
