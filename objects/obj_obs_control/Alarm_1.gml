/// @description Insert description here
// You can write your code in this editor

if(!obj_game.game_over)
{
	global.targetX=1830;
	global.targetY=462;
	var _obj = room_instance_add(roomMapa1,1700,460,obj_apple);
    TransitionStart(roomMapa1,TR_TYPE.BLUR);
}




