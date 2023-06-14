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
global.bpm = current_bpm;
BeatTimeMS=((60)/global.bpm)*1000000

audio_play_sound(current_music, 10, true,0.5);

//gui cosas


guiwidth = camera_get_view_width(oCameraManager.camera);
guiheight = camera_get_view_height(oCameraManager.camera);	

var _mode=global.room_data[global.currentroom][index.mode];

if (_mode == mode.fight)
{
    barscale=1.2;
}else
{
    barscale=0.6;
}
