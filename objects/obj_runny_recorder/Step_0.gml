/// @description Insert description here
// You can write your code in this editor

var _activate = keyboard_check_pressed(vk_space);
if(record)
{
	obj_runny_player.inmunity=true;
	if(_activate){	
	
		var _beat_num=global.BeatNumber+global.beatprogress;
		var _obs_type=obstacle.activate; 

		array_push(beat_map,[_beat_num,_obs_type]);
	}
}

// Inherit the parent event
event_inherited();

