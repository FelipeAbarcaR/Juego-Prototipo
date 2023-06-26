// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlaySFX(_stance){
	switch(_stance)
	{
		case EnemyStance.prepare:
			var _i=sfx_index;
			audio_play_sound(sfx_prepare[_i],10,0)
			sfx_index++;
			var _len=array_length(sfx_prepare)-1
			if(sfx_index>=_len) sfx_index =0;
		break;
	}

}