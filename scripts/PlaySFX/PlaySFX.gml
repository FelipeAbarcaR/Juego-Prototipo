// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function PlaySFX(_sound,_gain=undefined){
	with (obj_beat)
	{
		var gain;
		if(is_undefined(_gain)) gain=sfx_gain else gain=_gain;
	    audio_play_sound(_sound,10,0,gain)
	}
