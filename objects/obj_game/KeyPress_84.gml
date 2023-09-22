/// @description room restart
// You can write your code in this editor

audio_stop_all();
room_restart();
global.currentroom=get_current_room();
with(obj_beat)
{
    var _bgm= current(Index.music);
	current_music=_bgm;
	ResetBeatStats();
	bgm_snd=audio_play_sound(_bgm,10,1,bgm_gain);
	current_bpm=current(Index.bpm);
	global.bpm= current_bpm;
	global.BeatTimeMS=((60)/global.bpm)*1000000 //time of a beat in microseconds
	BeatTimeFrames=(60/global.bpm)*room_speed; //frames of a beat
}