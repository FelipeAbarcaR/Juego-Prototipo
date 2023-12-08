/// @description Insert description here
// You can write your code in this editor

//check if the plate is still in "released mode", it should be only one time
if(!plate_pressed && plate_released)
{
    plate_released=false;
}

var _pressed=0;

if(instance_exists(o_player))
{
	_pressed= place_meeting(x,y,o_player);
	player=o_player;
	
} else if(instance_exists(obj_crypt_player))
{
	_pressed = place_meeting(x,y,obj_crypt_player);
	player=obj_crypt_player;
}
	

if(_pressed)
{
	plate_pressed=true;
	if(player==obj_crypt_player)
	{	
		//if the plate was pressed by the crypt player, then change to o_player
		var _dir=obj_crypt_player.InputDirection;
		var _player_x=obj_crypt_player.x;
		var _player_y=obj_crypt_player.y;
		instance_create_depth(x,y,depth,obj_player_manager);
		if(instance_exists(obj_CryptManager))
		{
			obj_CryptManager.player_return=true;
			obj_CryptManager.player_direction=_dir;
			obj_CryptManager.player_return_x=_player_x;
			obj_CryptManager.player_return_y=_player_y;
			
		}
	}
    image_index=1;
}else
{
	//if is not pressed, check if it was released on the last step
	if (plate_pressed=true)
	{
	    plate_released=true;
	}
	
	plate_pressed=false;
	image_index=0;
}

if(plate_released)
{
	//switch plate_activated on/off
	plate_activated=!plate_activated;
	if(player==o_player)
	{
	    if(obj_beat.beats_per_input==1) beat_change_speed();
	}

}
