/// @description Insert description here
// You can write your code in this editor

/// @description Cause Room transition

if(instance_exists(o_player)) && (position_meeting(o_player.x,o_player.y,id))
{
	if( !instance_exists(obj_transition)) && (o_player.state != states.DEAD)
	{
		global.targetRoom = TargetRoom;
		//for(var i = 0; i <= global.room_count -1; i +=1 )
		//{
		//	if(global.targetRoom == global.room_data[i][index.name]) global.currentroom = i;
		//}
		global.targetX = TargetX;
		global.targetY = TargetY;
		global.targetdirection = o_player.dir;
		
		with(obj_player) state = states.IDLE;
		RoomTransition(TRANS_TYPE.SLIDE,global.targetRoom);
		instance_destroy();
	}
}