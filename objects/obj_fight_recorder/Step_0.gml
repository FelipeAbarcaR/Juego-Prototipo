/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

var _left_click= mouse_check_button_pressed(mb_left);
var _right_click= mouse_check_button_pressed(mb_right);
var _spacebar =keyboard_check_pressed(vk_space);

//1 prepare
//2 ataque
//0 restart

if(record)
{
	obj_fight_gato.invincible=true;
	
	if(_left_click){	
	
		var _beat_num=global.BeatNumber+global.beatprogress;
		var _obs_type=move.prepare; 
		var _x=mouse_x-x_start;
		var _y=mouse_y-y_start;

		array_push(fight_map,[_beat_num,_obs_type,_x,_y]);
	}

	if(_right_click){	
	
			var _beat_num=global.BeatNumber+global.beatprogress;
			var _obs_type=move.attack;
			var _x=mouse_x-x_start;
			var _y=mouse_y-y_start;

			array_push(fight_map,[_beat_num,_obs_type,_x,_y]);
	}
	if(_spacebar){

			var _beat_num=global.BeatNumber+global.beatprogress;
			var _obs_type=move.restart; 

			array_push(fight_map,[_beat_num,_obs_type,0,0])
	}
}








