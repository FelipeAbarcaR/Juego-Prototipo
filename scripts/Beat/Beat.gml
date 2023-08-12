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

function ChangeBGM(_newBGM)
{
     with(obj_beat)
	 {
		 new_music=_newBGM;
		 start_BGM_transition=true;
	   
	 }
}

function bgm_fade_transition()
{
     if(!start_bgm_fade_in)
		{
			    audio_sound_gain(current_music, 0, 300);
		}
		var _volumen = audio_sound_get_gain(current_music);
		if(_volumen<=0.01 && current_music!=new_music)
		{
			ResetBeatStats();
			audio_sound_gain(current_music, 1, 0);
			audio_stop_sound(current_music);
		    last_music=current_music;
			current_music=new_music;
			current_bpm = getBPM(new_music);
			global.bpm = getBPM(new_music);
			global.BeatTimeMS=((60)/global.bpm)*1000000;
			snd = audio_play_sound(current_music,10,1);
			start_bgm_fade_in=true;
			
		}
		if (current_music!=new_music)
		{
		if(start_bgm_fade_in && (current_music!=new_music || !audio_is_playing(current_music)))
		{
		    audio_sound_gain(snd, 0, 0);
			audio_sound_gain(snd, 1, 3000);
			var _volumen = audio_sound_get_gain(current_music);
			if(_volumen==1)
			{
			    start_bgm_fade_in=false;
				return true;
			} else return false;
		}
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