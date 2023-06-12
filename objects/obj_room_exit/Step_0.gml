/// @description Insert description here
// You can write your code in this editor

/// @description Cause Room transition

if(instance_exists(obj_player)) && (position_meeting(obj_player.x,obj_player.y,id))
{
	if( !instance_exists(obj_transition)) && (obj_player.state != PlayerStateDead)
	{
		global.targetRoom = TargetRoom;
		for(var i = 0; i <= global.room_count -1; i +=1 )
		{
			if(global.targetRoom == global.room_data[i][index.name]) global.currentroom = i;
		}
		global.targetX = TargetX;
		global.targetY = TargetY;
		global.targetdirection = obj_player.direction;
		
		with(obj_player) state = PlayerStateTransition;
		RoomTransition(TRANS_TYPE.SLIDE,global.targetRoom);
		instance_destroy();
	}
}