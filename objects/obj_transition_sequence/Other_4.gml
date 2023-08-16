/// @description Insert description here
// You can write your code in this editor

var _cam = oCameraManager

if (instance_exists(_cam))
{
    x=camera_get_view_x(_cam.camera);
	y=camera_get_view_y(_cam.camera);
	show_debug_message("hay cam,"+string(x)+", "+string(y))
}else
{
    x=0;
	y=0;
	show_debug_message("no hay cam :(, pointing 0,0");
	if(room==rm_GD)
	{
	    x=480;
	}
}

with(obj_beat)
{
    //The signal
	if (start_BGM_transition && change_step==transition_step.fading_out)
	{
		audio_sound_gain(current_music,1,0);
	    audio_stop_sound(current_music);
		mid_fading=false;
	    change_step=transition_step.set_parameters;
	}
}


