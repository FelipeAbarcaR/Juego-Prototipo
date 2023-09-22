/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_lshift))
{
	var _level=map_value(device_mouse_y_to_gui(0),0,global.res.guiheight,0,1)
	audio_sound_gain(bgm_snd,_level,0)
}



