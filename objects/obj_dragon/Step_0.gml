/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(start_mj)
{
    start_mj=false;
	var _exit = instance_nearest(x,y,obj_room_exit)
	with(_exit)
	{
		_exit._room_target=rm_runny;
		RoomTargetX=-1;
		RoomTargetY=-1;
	}

	start_shaking=true;
}
if(start_shaking)
{
    uc_shake(2,0);
}

