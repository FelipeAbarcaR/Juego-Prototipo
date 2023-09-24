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
		if(beat_speed==2)_midtime =global.BeatTimeMS else _midtime= global.BeatTimeMS/2 ; //fix para que el beat no sea en los bordes
	}
	
	BeatBarProgress =  sin((((SumFullDelta+_midtime)/(global.BeatTimeMS*beat_speed))*pi));
	
	//Beat's chance to hit
	
	if (abs(BeatBarProgress)<=beathitrange) global.beatchance =true; else global.beatchance =false;

//	var char = global.room_data[global.currentroom][Index.mainchar];

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
				ResetBeatStats();
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
		
		new_music=target(Index.music);
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
}else 
{
	mid_fading=false;
	
}

////BEAT BAR 2.0 STEP
//bar2_timer+=dt;
//if(bar2_timer>=time_to_beat-time_to_reach_end)
//{
//    time_to_beat+=global.BeatTimeMS*2;
//	bar2_store_meter(bar2_y-beat_frame_height);
//}

//var _length=array_length(beat_meter_list);
//if(_length>0)
//{
//    for(var i=0;i<_length;i++)
//	{
//	    beat_meter_list[i]+=beat_meter_speed;
//	}
	
//	if(beat_meter_list[0]>=bar2_y+bar2_range)
//	{
//	   var _last_time= array_shift(beat_meter_list);
//	}
	
//	if(keyboard_check_pressed(vk_space))
//	{
//	    var _obj = instance_create_depth(bar2_x,beat_meter_list[0],depth,obj_vanish)
//		_obj.sprite_index= spr_beat_meter_2;
//		_obj.image_xscale=2.5;
//		_obj.image_yscale=2.5;
//		_obj.draw_on_gui=true;
//	}
//}

