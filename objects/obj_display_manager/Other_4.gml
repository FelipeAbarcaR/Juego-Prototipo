/// @description Insert description here
// You can write your code in this editor

display_width=display_get_width();
display_height=display_get_height();

window_width=window_get_width();
window_height=window_get_height();

gui_width=display_get_gui_width();
gui_height=display_get_gui_height();

surfaceid=application_surface;
surface_width=surface_get_width(application_surface);
surface_height=surface_get_height(application_surface);

camera_width=camera_get_view_width(view_camera[0]);
camera_height=camera_get_view_height(view_camera[0]);

viewport_width=view_wport[0];
viewport_height=view_hport[0];

res_width=global.res.width;
res_height=global.res.height;

camid0=view_camera[0];

