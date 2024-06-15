/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_self();
if(global.DrawText)
{
	draw_text(x,y+16,string(global.beatprogress));
	draw_text(x,y+32,string(image_index));
}

var _x=x-uc_get_view_x();
var _y=y-uc_get_view_y();

with(obj_light_tester)
{
    if (surface_exists(dark_surface)) {
	surface_set_target(dark_surface)
    gpu_set_blendmode(bm_subtract);
    draw_sprite(spr_flashlight, 0, _x,_y);
    gpu_set_blendmode(bm_normal);
	surface_reset_target();
	}
}