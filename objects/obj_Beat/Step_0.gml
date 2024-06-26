/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

//beat
	var dt =delta_time;	
	SumDelta+=dt;
	SumFullDelta+=dt;

//Check if reached the beat
	if (SumDelta>=global.BeatTimeMS) 
	{
	global.beat=true;
	SumDelta -= global.BeatTimeMS;
	global.BeatNumber+=1;
	if(global.DrawText) audio_play_sound(Beep,11,false,1);
	//instance_create_layer(barX, barY,"Instances",obj_vanish_GUI);
	} else global.beat=false;

//beat progress from 0 to 1
	global.beatprogress=min(SumDelta/global.BeatTimeMS,1);
	
//beat meter
	var _midtime=0
	if(beat_fix)
	{
		if(beats_per_input==2)_midtime =global.BeatTimeMS else _midtime= global.BeatTimeMS/2 ; //fix para que el beat no sea en los bordes
	}
	
	BeatBarProgress =  sin((((SumFullDelta+_midtime)/(global.BeatTimeMS*beats_per_input))*pi));
	

//	var char = globa	l.room_data[global.currentroom][Index.mainchar];

// draw vanishing BeatBar
	var _player_mainchar = global.room_data[global.currentroom][Index.mainchar]
	var _mode= global.room_data[global.currentroom][Index.mode]

//Fight things
	if(global.fight_music_start)
	{
		if(instance_exists(obj_fight_control))
		{
		    if(audio_is_playing(current_music))
			{
				    audio_sound_gain(current_music, 0, 300);
			}
			var _volumen = audio_sound_get_gain(current_music);
			if(_volumen<=0.1 && instance_exists(obj_fight_control.fighter2))
			{
				audio_sound_gain(current_music, 1, 0);
				audio_stop_sound(current_music);
			    last_music=current_music;
				current_music=obj_fight_control.fighter2.bgm;
				current_bpm = obj_fight_control.fighter2.bpm;
				global.bpm = current_bpm;
				global.BeatTimeMS=((60)/global.bpm)*1000000;
				global.fight_music_start = false;
				var snd = audio_play_sound(current_music,10,1);
				audio_sound_gain(snd, 0, 0);
				audio_sound_gain(snd, 1, 3000);
				ResetBeatStats();
			}
		}
	}
	
	
//Change BGM its called from ChangeBGM() function

if(start_BGM_transition)
{
	//set transition time
	var _time;
	if(new_transition_time!=(-1))
	{
	    _time=(new_transition_time/2)*1000;
	} else _time=(bgm_transition_time/2)*1000;
	
	
	if(change_step==transition_step.fading_out)
	{
		if(!transition_in_ready)
		{
			
			transition_in_ready= bgm_fade_out(_time);
			if(transition_in_ready)
			{
			    if(wait_for_signal)
				{
				    //just wait till someone(obj_transition_sequence) change his changestep
				} else change_step=transition_step.set_parameters
			}
		}
	}
	
	if(change_step==transition_step.set_parameters)
	{
		bgm_transition_set_values();
		audio_stop_all();
		bgm_snd=audio_play_sound(current_music,10,1,starting_volume); //song start at 0.1 and begin fading volume up
		change_step=transition_step.fading_in;
	}
	
	if(change_step==transition_step.fading_in)
	{

	    var _transition_in_ready= bgm_fade_in(_time);
		
		if (_transition_in_ready)
		{
			change_step=transition_step.fading_out;
			start_BGM_transition=false;
			show_debug_message("BGM Changed successfully");
		}
		
	}
}
//beat meter vanishing
switch(_player_mainchar)
	{
		case o_player: 
			if (_mode == mode.move and global.interact)
			{
				var _bar = instance_create_layer(barX, barY,"Instances",obj_vanish);
				_bar.draw_on_gui=true;
			}
		break;
		
		default:
			if (_mode == mode.move and _player_mainchar.inputmagnitude)
			{
				var _bar instance_create_layer(barX, barY,"Instances",obj_vanish);
				_bar.draw_on_gui=true;
			}
		break;		
	}
		
//fate in/out along with obj_transition_manager's progress
if(instance_exists(obj_transition_manager))
{
var _tp=obj_transition_manager.transition_progress;
	//Fade out volumen while in first half of progress
	
	if(_tp >0 and _tp<=0.5)
	{
		var new_gain=1-map_value(_tp,0,0.5,0,1);
		var scaled_new_gain=map_value(new_gain,0,1,0,bgm_gain);
		audio_sound_gain(bgm_snd,scaled_new_gain,0);
	}
	if(_tp>=0.5 && !mid_fading)
	{
		mid_fading=true;
		
		new_music=room_target(Index.music);
		show_debug_message("new_music: " +string(audio_get_name(new_music)));
		bgm_snd=audio_play_sound(new_music,10,1,0);
		bgm_transition_set_values();
			
	}
	if(_tp>=0.5)
	{
		var new_gain=map_value(_tp,0.5,1,0,1);
		var scaled_new_gain=map_value(new_gain,0,1,0,bgm_gain);
		if(bgm_snd!=-1)
		{
			audio_sound_gain(bgm_snd,scaled_new_gain,0);
		}else show_debug_message("obj_beat con transicion,no se encontró bgm_snd para subirle volumen compra")
		show_debug_message("sound volume: "+string(audio_sound_get_gain(bgm_snd)));
	}
}else mid_fading=false;


//BEAT BAR 2.0 STEP

bar2_timer+=dt;

//SET A NEW BEAT TO START MOVING DOWN TO THE "HEART"
//beat fix to half tempo
var _fix=0;
if(beat_fix) _fix=global.BeatTimeMS/2;

beat_bar_is_beating=beat_check_if_can_beat();


if(bar2_timer>=time_to_beat-time_to_reach_end+_fix)//If it is the time to drop a meter
{
    time_to_beat+=global.BeatTimeMS*beats_per_input; //set the time of the new beat meter
	
	if(beat_bar_is_beating) bar2_store_meter(bar2_y-beat_frame_height); //store the new meter in array, starting from top of frame
}

var _length=array_length(beat_meter_list);

if(_length>0) //if it is at least one beat meter in the array
{
	var _last_beat_position = beat_meter_list[0];
	//check if the beat can be hit, for now this hapenns if the beat is NOT frozen
	var _beatable=(!frozen_beat);
	
	//Beat's chance to hit
	var _distance_from_heart=point_distance(bar2_x,_last_beat_position,bar2_x,bar2_y);
	if (_distance_from_heart<=bar2_range) global.beatchance =true else global.beatchance =false;
    
	for(var i=0;i<_length;i++)
	{
		//change the position of every beat meter
	    beat_meter_list[i]	+=	beat_meter_speed;
	}
	
	if(_last_beat_position>=bar2_y+bar2_range) //if beat meter reach the bottom of range
	{	   
		if(_beatable) 
		{
			var _last_time= array_shift(beat_meter_list); //delete the beat meter of the array
			if(groovy_count>0) //reset the groovy counter
			{
				if(global.groovy)groovy_count-- else groovy_count=0;
				
				play_sfx(sfx_groovy_error)// code here
			}
		}
		else
		{
		    var _last_time= array_shift(beat_meter_list); //delete the beat meter of the array
			frozen_beat=false;
		}
	}
	//INPUT CHECK
	var _player_input=0;
	
	if(instance_exists(obj_crypt_player))
	{
	   if (obj_crypt_player.key_direction_pressed) _player_input=true;
	}
	
	
	//IF THERE IS A KEY INPUT
	var _activate_key=global.interact;
	if(	_activate_key || _player_input)
	{
		
		//Create a vanishing paw in the position when the key was inputted
		var _obj = instance_create_depth(bar2_x,_last_beat_position,depth,obj_vanish);
		_obj.sprite_index= spr_beat_meter_4;
		_obj.image_xscale=1.5;
		_obj.image_yscale=1.5;
		_obj.draw_on_gui=true;
		_obj.sprite_color=c_orange;
		if(!_beatable) //if it isnt beatable, then it's frozen. 
		{
			//frozen shattered paw sprite
			_obj.sprite_index=spr_beat_meter_4_shattered;
			_obj.image_speed=1;
		}
		
		if(_beatable)
		{
			perfect_good_bad(); //store the beat status (perfect,good,almost);
			
			if(global.beatchance) //if the input was in beatchance
			{
				var _last_time= array_shift(beat_meter_list);	//delete the beat meter of the array
				if(!global.groovy)groovy_count+=1 else groovy_count=groovy_max;								//add a counter to get the LGTB mode
				heart_pulse=true;								//shake the jingle bell
				beat_heart_t=0;									//set the timer again in case it was already shaking
			}
			else // if the input was not in beatchance
			{
				beat_missed();//delete the lowest paw, reset groovy counter and play error sound
			}
		}
		else //if the input was during a beat not able to be beaten
		{
			beat_missed();//delete the lowest paw, reset groovy counter and play error sound
		}
	}
}

if(!global.groovy)
{
	if (groovy_count>=groovy_max)
	{
		global.groovy=true;
		if(!instance_exists(obj_groovy_meter)) instance_create_depth(x,y,depth,obj_groovy_meter);
	}
	
}else if(groovy_count<=0)
{
	global.groovy=false;
	if(instance_exists(obj_groovy_meter)) instance_destroy(obj_groovy_meter);
}

