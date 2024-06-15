/// @description Insert description here
// You can write your code in this editor

if(!surface_exists(dark_surface)) dark_surface=surface_create(global.res.width,global.res.height);

if (surface_exists(dark_surface)) {
    surface_set_target(dark_surface);
    draw_clear_alpha(c_black, darkness);
	surface_reset_target();
}