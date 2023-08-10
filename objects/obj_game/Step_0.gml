if(keyboard_check_pressed(vk_escape))
{
	if(!pause)
	{
		pause = true;
		
		//Deactivate instances
		instance_deactivate_all(true);
		
		//Create surface
		pause_surf = surface_create(global.res.width,global.res.height);
		
		//Copy 
		surface_copy(pause_surf,0,0,application_surface);

		//UI
		event_user(0);
		
		
	}
	else
	{
		pause = false;
		
		//Activate instances
		instance_activate_all();
		
		//Remove surface
		if(surface_exists(pause_surf)) //Chequeamos esto porque las superficies pueden ser destruidas automaticamente
		{
			surface_free(pause_surf);
		}
		
		//UI
		event_user(1);
	}
}

changeroom = keyboard_check_pressed(ord("M"));
muteall= keyboard_check_released(ord("N"));

// on/off draw text from instances
if keyboard_check_released(vk_lshift){
	if (global.DrawText=true) global.DrawText=false else global.DrawText=true;
}

//change room system

if changeroom { //If pressed M to change room

	audio_stop_all();
	global.previousroom = global.currentroom;
    global.currentroom += 1;
    if (global.currentroom > global.room_count - 1)
    {

        global.currentroom = 0;
    }
    room_goto(global.room_data[global.currentroom][index.name]);

}
//mute all
if muteall
{
	if (mute) mute=0 else mute=1; 
	var info = audio_get_listener_info(0);
	audio_set_master_gain(info[? "index"], 1-mute);

	ds_map_destroy(info);
}

//FIGHT ENDED
if(global.fight_ended)
{
	global.fight_ended=-1;
	//set alarm 
    alarm[0]=room_speed*delay_to_return_from_fight;
}