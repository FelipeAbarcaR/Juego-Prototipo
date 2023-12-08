/// @description Insert description here
// You can write your code in this editor
var _player = o_player;
var _collided= position_meeting(_player.x,_player.y,object_index);//place_meeting(_player.x,_player.y,object_index);
if(_collided) 
{
	if(!audio_is_playing(sound_steps)) play_sfx(sound_steps);
	o_player.walk_friction=0.45;
    collided=true;
}else 
{
	if(audio_is_playing(sound_steps))audio_stop_sound(sound_steps);
	collided=false;
	o_player.walk_friction=0;
}

//if(collided==false)
//{
//	effect_params.g_FractalNoiseScale=5
//	fx_set_parameters(effect,effect_params)

//} else
//{
//	effect_params.g_FractalNoiseScale=194
//	fx_set_parameters(effect,effect_params)
//}
