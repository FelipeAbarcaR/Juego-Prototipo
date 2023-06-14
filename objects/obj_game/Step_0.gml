/// @description Insert description here
// You can write your code in this editor


changeroom = keyboard_check_pressed(ord("M"));
muteall= keyboard_check_released(ord("N"));

// on/off draw text from instances
if keyboard_check_released(vk_lshift){
	if (global.DrawText=true) global.DrawText=false else global.DrawText=true;
}

//change room system

if changeroom { //If pressed M to change room
	hola=10;
	audio_stop_all();
	global.previousroom = global.currentroom;
    global.currentroom += 1;
    if (global.currentroom > global.room_count - 1)
    {
		hola=10
        global.currentroom = 0;
    }
    room_goto(global.room_data[global.currentroom][index.name]);
	if (room_get_name(room)==roomViejoSabio)
	{
		hola=room_get_name(room);
	}
	
	}

if muteall{
	if (mute) mute=0 else mute=1; 
	var info = audio_get_listener_info(0);
	audio_set_master_gain(info[? "index"], mute);

	ds_map_destroy(info);
}