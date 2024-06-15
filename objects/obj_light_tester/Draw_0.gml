/// @description Insert description here
// You can write your code in this editor

if (surface_exists(dark_surface)) {
	surface_set_target(dark_surface);
    gpu_set_blendmode(bm_subtract);
    gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface(dark_surface,uc_get_view_x(),uc_get_view_y());
	surface_free(dark_surface);
}