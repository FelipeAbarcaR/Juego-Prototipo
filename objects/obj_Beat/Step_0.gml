/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

//Activar obstáculos Obstacle1 
	MoveKey=keyboard_check_pressed(vk_control);

	var sKey=keyboard_check_pressed(ord("S"));
	if sKey
	{
		audio_play_sound(Beep,100,0,1,0,3)
		var _barra=instance_create_layer(x, y,"Instances",obj_vanish_GUI);
		with(_barra)
			{
				sprite_index=img_BeatMeter;
			}
	}
//start movement's obstacles
if(MoveKey)
{
	if(global.Move==false) global.Move=true else global.Move=false;
}
//counting hand
var _hKey=keyboard_check_pressed(ord("H"));
if (_hKey) instance_create_layer(0,0, "Instances", obj_CountHand);

//beat
	var dt =delta_time;	
	SumDelta+=dt;
	SumFullDelta+=dt;

	if (SumDelta>=global.BeatTimeMS) 
	{
	global.beat=true;
	SumDelta -= global.BeatTimeMS;
	global.BeatNumber+=1;
	audio_play_sound(Beep,11,false);
	//instance_create_layer(barX, barY,"Instances",obj_vanish_GUI);
	} else global.beat=false;

//beat progress from 0 to 1
	global.beatprogress=min(SumDelta/global.BeatTimeMS,1);
//beat meter
	BeatBarProgress = sin(((SumFullDelta/global.BeatTimeMS)*pi));
	//Beat's chance to hit
	if (abs(BeatBarProgress)<=beathitrange) global.beatchance =true; else global.beatchance =false;

//	var char = global.room_data[global.currentroom][index.mainchar];

// draw vanishing BeatBar
	var _player_mainchar = global.room_data[global.currentroom][index.mainchar]
	var _mode= global.room_data[global.currentroom][index.mode]

//Fight things
	if(global.fight_music_start)
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
//Change BGM

if(start_BGM_transition)
{
    var _listo=bgm_fade_transition();
	if (_listo) start_BGM_transition=false;
}

	//beat meter vanishing
	switch(_player_mainchar)
	{
		case o_player: 
			if (_mode == mode.move and global.interact)
			{
				instance_create_layer(barX, barY,"Instances",obj_vanish_GUI);
			}
		break;
		
		default:
			if (_mode == mode.move and _player_mainchar.inputmagnitude)
			{
				instance_create_layer(barX, barY,"Instances",obj_vanish_GUI);
			}
		break;		
	}
		
