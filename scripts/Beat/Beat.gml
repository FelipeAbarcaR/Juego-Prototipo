// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ResetBeatStats(){
	global.beatchance=false;
	global.beat=false;
	global.BeatNumber=0;
	SumDelta=0;
	SumFullDelta=0;
	BeatBarProgress=0;
	global.beatprogress=0
	groovy_count=0;
	bar2_timer=0;
	time_to_beat=global.BeatTimeMS*beats_to_start;
	
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
			current_bpm = get_bpm(new_music);
			global.bpm = current_bpm
			global.BeatTimeMS=((60)/global.bpm)*1000000;
			reset_beat_bar_2_variables();
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
 
 
function get_bpm(_BGM)
{
	var _data=obj_beat.BGM_data
	var arrayLength = array_length(_data);

	for (var i = 0; i < arrayLength; i++) {
	    if (_data[i, 0] == _BGM) {
	        return _data[i, 1];
	    }
    }

}

/// @description any_audio_is_playing()
/// @function any_audio_is_playing
function any_audio_is_playing()
{
	for (var i = 0; audio_exists(i); i++)
	{
		if audio_is_playing(i)
			return true;
	}
	return false;
}

function setBPM(_bpm)
{
	var bpm=_bpm;
	obj_beat.current_bpm=bpm;
    global.bpm = bpm
	global.BeatTimeMS=((60)/global.bpm)*1000000;
	
}


//dibujar la barrita de ritmo que se desvanece

function draw_vanish_beatbar()
{
    with(obj_beat)
	{
	    var _bar = instance_create_layer(barX, barY,"Instances",obj_vanish);
		_bar.draw_on_gui=true;
	}
}

//Beat Bar 2 functions
 //store a new beat_meter to the list
 function bar2_store_meter(_y){

	array_push(beat_meter_list, _y);
}
function reset_beat_bar_2_variables()
{
    BeatTimeFrames=(60/global.bpm)*room_speed;

	bar2_timer=0;
	time_to_beat=global.BeatTimeMS*beats_to_start;
	time_to_reach_end=(beat_frame_height/beat_meter_speed)*(1/room_speed)*1000000;

	beat_meter_list=[]; 
}

function play_sfx(_sfx)
{
    with(obj_beat)
	{
	    audio_play_sound(_sfx,10,0,sfx_gain);
	}
}

function beat_change_speed(N_Beats)
{
    with(obj_beat)
	{
		if(beats_per_input==1) beats_per_input=2 else beats_per_input=1;
		if(N_Beats!=undefined) beats_per_input=N_Beats;
	}

}

function beat_missed()
{
    var _last_time= array_shift(beat_meter_list); //delete the beat meter of the array
	if(groovy_count>0) //reset the groovy counter
	{
		groovy_count=0;
		play_sfx(sfx_groovy_error)// code here
	}
}