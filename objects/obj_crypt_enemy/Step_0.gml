/// @description Insert description here
// You can write your code in this editor

var _idle=sprite_index==spr_idle;


if(_idle)
{
    if(global.beat) image_index++;
}

if(instance_exists(obj_crypt_player) && _idle)
{
	if(position_meeting(x-16-8,y,obj_crypt_player))
	{
		sprite_index=spr_attack;
		image_index=0;
		alarm[0]=(global.BeatTimeMS/1000000)*room_speed;
	}
	
}


if(start_attack)
{
	var _bp=global.BeatNumber+global.beatprogress-beat_progress;
    x--;
	image_index=map_value(_bp,0,0.8,0,image_number-1);
	
	if(x==xstart-11)
	{
	    alarm[1]=(global.BeatTimeMS/1000000)*room_speed;
		start_attack=false;
	}
	
	
}





