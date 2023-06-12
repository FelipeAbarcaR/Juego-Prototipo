/// @description Insert description here
// You can write your code in this editor

image_speed=0;
image_index=0;

EndingSpriteIndex = [0,4,10,16,23,29]
ic=0;  //indexcounter
move=false;
StartCounting=true;

guiwidth=camera_get_view_width(obj_camera.cam);
guiheight=camera_get_view_height(obj_camera.cam);

game_mode=global.room_data[global.currentroom][index.mode]
//guiwidth=display_get_gui_width();
//guiheight=display_get_gui_height();