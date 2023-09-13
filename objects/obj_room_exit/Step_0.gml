/// @description Insert description here
// You can write your code in this editor

/// @description Cause Room transition
var _player=o_player;
var _room=room_target;
if(!global.midTransition)
{
	if(instance_exists(_player))
	{
		if((position_meeting(_player.x,_player.y,id) && _player!= states.DEAD))
		{
		    global.roomTarget = _room;
			global.targetX = RoomTargetX;
			global.targetY = RoomTargetY;
			global.targetdirection = _player.dir;
			o_player.state = states.IDLE;
			TransitionStart(_room,TR_TYPE.FADE_TWOPASS);
		}
	
	}
}

//if(instance_exists(o_player)) && (position_meeting(o_player.x,o_player.y,id))
//{
//	if( !instance_exists(obj_transition)) && (o_player.state != states.DEAD)
//	{
//		global.roomTarget = target_room;
//		global.targetX = targetX;
//		global.targetY = targetY;
//		global.targetdirection = o_player.dir;
		
//		with(obj_player) state = states.IDLE;
//		var _bgm = target(Index.music);
//		TransitionStart(target_room,sequence_out,sequence_in,2.0,_bgm);
//		//RoomTransition(TRANS_TYPE.SLIDE,global.roomTarget);
//		//instance_destroy();
//	}
//}