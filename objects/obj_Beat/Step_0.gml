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

	if (SumDelta>=BeatTimeMS) 
	{
	global.beat=true;
	SumDelta -= BeatTimeMS;
	global.BeatNumber+=1;
	audio_play_sound(Beep,11,false);
	//instance_create_layer(barX, barY,"Instances",obj_vanish_GUI);
	} else global.beat=false;

//beat progress from 0 to 1
	global.beatprogress=min(SumDelta/BeatTimeMS,1);

//beat meter
	BeatBarProgress = sin((SumFullDelta/BeatTimeMS)*pi);
	//Beat's chance to hit
	if (abs(BeatBarProgress)<=beathitrange) global.beatchance =true; else global.beatchance =false;

//	var char = global.room_data[global.currentroom][index.mainchar];

// draw vanishing BeatBar
	var _player_mainchar = global.room_data[global.currentroom][index.mainchar]
	var _mode= global.room_data[global.currentroom][index.mode]
	
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

		
	
