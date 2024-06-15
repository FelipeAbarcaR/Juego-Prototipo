/// @description Insert description here
// You can write your code in this editor

show_debug_message("obj_light_tester: entranding");
lay_id=layer_get_id("DarkEffect");

dark_surface = surface_create(global.res.width, global.res.height);
if (!surface_exists(dark_surface)){
    dark_surface = surface_create(global.res.width, global.res.height);
};

darkness=0.8;