if(input_check_pressed("pause"))
{
	if(!pause)
	{
		pause = true;
		
		//Deactivate instances
		instance_deactivate_object(prnt_entity);
		instance_activate_object(input_controller_object);
		
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
		instance_activate_object(prnt_entity);
		
		//Remove surface
		if(surface_exists(pause_surf)) //Chequeamos esto porque las superficies pueden ser destruidas automaticamente
		{
			surface_free(pause_surf);
		}
		
		//UI
		event_user(1);
	}
}

if(input_check_pressed("restart"))
{
	event_user(2);	
}

if(input_check_pressed("restart_room"))
{
	event_user(3);
}

if(keyboard_check_pressed(ord("Q")))
{
	uc_set_view_scale(2,0.1);
	surface_resize(application_surface,Camera.view_width*2,Camera.view_height*2);
	
}

changeroom = input_check("change_map");
muteall= input_check_pressed("mute");

// on/off draw text from instances
if keyboard_check_released(vk_lshift){
	if (global.DrawText=true)
	{
		global.DrawText=false;
		layer_set_visible(layer_get_id("Collisions"),false);
		
	}else {
		global.DrawText=true;
		layer_set_visible(layer_get_id("Collisions"),true);
	}
}

//change room system

if changeroom { //If pressed M to change room

	if(!global.midTransition)
	{
		var _target_room = global.currentroom + 1;
	    if (_target_room > global.room_count - 1)
	    {
	        _target_room = 0;
	    }
	    var _room = global.room_data[_target_room][Index.name];
		var _bgm = global.room_data[_target_room][Index.music];
		TransitionStart(_room,TR_TYPE.FADE_TWOPASS);
	}else show_debug_message("obj_game, changeroom: You are already in a transition marico");
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

//transition change room and start fading up the interface and bgm at the same time
if(global.midTransition && !changed_room) CheckSincronizedTransition();

//GAMEOVER
if(global.playerhealth<=0)
{
    game_over=true;
	instance_deactivate_all(1);
	instance_activate_object(input_controller_object);
}

//game time
var _dt=delta_time;
game_time+=_dt;
room_time+=_dt;

global.zoom = input_mouse_wheel_down() - input_mouse_wheel_up();
//Wheel zoom
if(global.zoom != 0)
	{
		global.zoom *= 0.05;
		
		var _scale = Camera.view_scale_target + global.zoom;
		var _scale_prev = _scale;
		
		Camera.view_scale_target = _scale;
		
		surface_resize(application_surface,Camera.view_width*_scale,Camera.view_height*_scale);

	}
