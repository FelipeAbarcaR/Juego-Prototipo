/// @description Insert description here
// You can write your code in this editor

image_speed=0;
image_index=0;

EndingSpriteIndex = [0,4,10,16,23,29]
ic=0;  //indexcounter
move=false;
StartCounting=true;

var _cam	=	oCameraManager;
if(instance_exists(_cam))
{
	guiwidth=camera_get_view_width(_cam.camera);
	guiheight=camera_get_view_height(_cam.camera);
}else 
{
    guiwidth=global.res.guiwidth;
}	guiheight=global.res.guiheight;


game_mode=global.room_data[global.currentroom][index.mode]
//guiwidth=display_get_gui_width();
//guiheight=display_get_gui_height();