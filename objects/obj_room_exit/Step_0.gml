/// @description Insert description here
// You can write your code in this editor

/// @description Cause Room transition

if(instance_exists(o_player)) && (position_meeting(o_player.x,o_player.y,id))
{
	if( !instance_exists(obj_transition)) && (o_player.state != states.DEAD)
	{
		global.targetRoom = target_room;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetdirection = o_player.dir;
		
		with(obj_player) state = states.IDLE;
		TransitionStart(target_room,sequence_out,sequence_in);
		//RoomTransition(TRANS_TYPE.SLIDE,global.targetRoom);
		//instance_destroy();
	}
}