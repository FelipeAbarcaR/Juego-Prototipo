/// @description Start Music& beats
// You can write your code in this editor

if(!any_audio_is_playing())
{
    var _bgm= current(index.music);
	ResetBeatStats();
	audio_play_sound(_bgm,10,1,0.4);
}
current_bpm=current(index.bpm);
global.bpm= current_bpm;
global.BeatTimeMS=((60)/global.bpm)*1000000 //time of a beat in microseconds
BeatTimeFrames=(60/global.bpm)*room_speed; //frames of a beat
global.beatchance=false;
global.beat=false;
global.Move=false;	
global.beatprogress=0;
global.BeatNumber=0;