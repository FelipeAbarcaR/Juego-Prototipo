/// @description Insert description here
// You can write your code in this editor

time+=delta_time/1000000;

var _array_len=array_length(beat_play_array);

if (time>=beat_play_array[0][0]) && _array_len>1 {
	if _array_len==2 {

	}
    // Create the obstacle and erase first row
    instance_create_depth(x, y,depth, obj_obstacle,{obs_type : beat_play_array[0][1]});

	array_shift(beat_play_array);
} else {
    // Decrease the creation time by the time passed
    //creation_time -= delta_time / 1000000; // Convert delta_time to seconds
}

