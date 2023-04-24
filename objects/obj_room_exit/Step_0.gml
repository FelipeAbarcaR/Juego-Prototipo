/// @description Cause Room transition

if(instance_exists(obj_player)) && (position_meeting(obj_player.x,obj_player.y,id))
{
	if( !instance_exists(obj_transition)) && (obj_player.state != PlayerStateDead)
	{
		global.targetRoom = TargetRoom;
		global.targetX = TargetX;
		global.targetY = TargetY;
		global.targetdirection = obj_player.direction;
		with(obj_player) state = PlayerStateTransition;
		RoomTransition(TRANS_TYPE.SLIDE, TargetRoom);
		instance_destroy();
	}
}