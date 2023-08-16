// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ResetBeatStats(){
	global.beatchance=false;
	global.beat=false;
	global.BeatNumber=0;
	SumDelta=0;
	SumFullDelta=0;
	BeatBarProgress=0;
}

function ChangeBGM(_newBGM,_time,_wait_for_room=false)
{
     with(obj_beat)
	 {
		 new_music=_newBGM;
		 new_speed_transition=_time;
		 start_BGM_transition=true;
		 wait_for_signal=_wait_for_room;
	 }
}
function bgm_fade_out(_time)
{
	var transition_time = _time; // Time in milliseconds
	var frames = (transition_time * room_speed) / 1000; // Convert time to frames

	var _actual_volume = audio_sound_get_gain(current_music);
	var _decrease_gain = 1 / frames;
	var _gain=_actual_volume-_decrease_gain;
	_gain = clamp(_gain, 0, 1);
	audio_sound_gain(current_music,_gain,0);
	
	if(_gain<=0.01)
	{
		audio_sound_gain(current_music,1,0);
	    audio_stop_sound(current_music);
		mid_fading=false;
		return true;
	}else return false;

}
function bgm_transition_set_values(){
			ResetBeatStats();
		    last_music=current_music;
			current_music=new_music;
			current_bpm = getBPM(new_music);
			global.bpm = current_bpm
			global.BeatTimeMS=((60)/global.bpm)*1000000;			
}
function bgm_fade_in(_time)
{
	var transition_time = _time; // Time in milliseconds
	var frames = transition_time * 60 / 1000; // Convert time to frames

	var _increase_gain = (1-starting_volume) / frames;
	var _current_volume=current_volume;
	var _gain = _current_volume +_increase_gain;
	_gain = clamp(_gain, 0.1, 1);
	audio_sound_gain(bgm_snd,_gain,0);
	current_volume=_gain;
	var _volumen = audio_sound_get_gain(bgm_snd);
	
	if(_gain>=1)
	{
		//current_volume=starting_volume;
		return true;
	}else
	{
	    return false;
	}
}
 
 
function getBPM(_BGM)
{
	   var arrayLength = array_length(BGM_data);

	    for (var i = 0; i < arrayLength; i++) {
	        if (BGM_data[i, 0] == _BGM) {
	            return BGM_data[i, 1];
	        }
    }

}