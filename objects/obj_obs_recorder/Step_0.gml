/// @description Insert description here
// You can write your code in this editor

var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _side = keyboard_check_pressed(vk_left) ||keyboard_check_pressed(vk_right);

if(record)
{
	if(_up){	
	
		var _beat_num=global.BeatNumber+global.beatprogress;
		var _obs_type=obstacle.up; 

		array_push(beat_map,[_beat_num,_obs_type]);
	}

	if(_down){	
	
			var _beat_num=global.BeatNumber+global.beatprogress;
			var _obs_type=obstacle.down; 

			array_push(beat_map,[_beat_num,_obs_type]);
	}
	if(_side){

			var _beat_num=global.BeatNumber+global.beatprogress;
			var _obs_type=obstacle.updown; 

			array_push(beat_map,[_beat_num,_obs_type])
	}
}