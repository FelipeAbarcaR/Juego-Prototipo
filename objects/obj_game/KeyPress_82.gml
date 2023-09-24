game_restart();
TransitionResetValues();
audio_stop_all();
global.currentroom=0;
game_over=false;
global.playerhealth = global.playerhealthmax;
instance_activate_all();
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
	reset_beat_bar_2_variables();
}