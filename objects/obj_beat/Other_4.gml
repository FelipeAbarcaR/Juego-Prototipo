/// @description Start Music& beats
// You can write your code in this editor


global.beatchance=false;
global.beat=false;
global.BeatNumber=0;
SumDelta=0;
SumFullDelta=0;
BeatBarProgress=0;
current_music = global.room_data[global.currentroom][index.music];
current_bpm = global.room_data[global.currentroom][index.bpm];
bpm=current_bpm;
BeatTimeMS=((60)/bpm)*1000000

audio_play_sound(current_music, 10, true,0.5);

//gui cosas

guiwidth=camera_get_view_width(obj_camera.cam);
guiheight=camera_get_view_height(obj_camera.cam);	

var _mode=global.room_data[global.currentroom][index.mode];
if (_mode=mode.fight)
{
    barscale=1.2;
}else
{
    barscale=0.6;
}
