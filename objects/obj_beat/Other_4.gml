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
global.BeatTimeMS=((60)/global.bpm)*1000000

audio_play_sound(current_music, 10, true,0.5);

//gui cosas
//var _mode=global.room_data[global.currentroom][index.mode]
//if (_mode!=mode.fight)
//{
//	var _res=global.res;
//	guiwidth = _res.width;
//	guiheight = _res.height;	
//} else
//	{
		
	  //  guiwidth = display_get_gui_width();
	//	guiheight = display_get_gui_height();
	//}
	

var _mode=global.room_data[global.currentroom][index.mode];

//if (_mode == mode.fight)
//{
//    barscale=0.6;
//}else
//{
//    //barscale=0.6;
//}
