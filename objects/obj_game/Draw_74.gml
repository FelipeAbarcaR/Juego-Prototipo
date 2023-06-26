/// @description Draw the pause surface

//Pause surface

if(pause && surface_exists(pause_surf))
{
	draw_surface_ext(pause_surf,0,0,1,1,0,c_gray,1);
}
