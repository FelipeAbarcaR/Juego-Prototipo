/// @description Insert description here
// You can write your code in this editor


changeroom = keyboard_check_pressed(ord("M"));
muteall= keyboard_check_pressed(ord("N"));

// on/off draw text from instances
if keyboard_check_released(vk_lshift){
	if (global.DrawText=true) global.DrawText=false else global.DrawText=true;
}

if changeroom {
	audio_stop_all();
    global.currentroom += 1;
    if (global.currentroom > room_count - 1)
    {
        global.currentroom = 0;
    }
    room_goto(room_data[global.currentroom][index.name]);
	}

if muteall{
	if (mute) mute=0 else mute=1; 
	var info = audio_get_listener_info(0);
	audio_set_master_gain(info[? "index"], mute);
	hola=room_get_name(room);
	ds_map_destroy(info);
}