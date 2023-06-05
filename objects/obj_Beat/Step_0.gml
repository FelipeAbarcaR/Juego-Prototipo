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
scr_CountingHand();

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
	//var _barra=instance_create_layer(x, y,"Instances",obj_vanish_GUI);
	//with(_barra)
	//	{
	//		sprite_index=img_BeatMeter;
	//	}
	} else global.beat=false;

//beat progress from 0 to 1
	global.beatprogress=min(SumDelta/BeatTimeMS,1);

//beat meter
	BeatBarProgress = sin((SumFullDelta/BeatTimeMS)*pi)
	if (abs(BeatBarProgress)<=beathitrange) global.beatchance =true else global.beatchance =false

	var char = obj_game.room_data[global.currentroom][index.mainchar];

//draw vanishing BeatBar
	if (char.inputmagnitude and obj_game.room_data[global.currentroom][index.mode]!=mode.move)
	{
		with(instance_create_layer(x, y,"Instances",obj_vanish_GUI))
		{
			sprite_index=img_BeatMeter;
		}
	}
	
