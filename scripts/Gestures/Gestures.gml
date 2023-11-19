// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//GESTURES/EMOTICONS

enum GESTURE
{
    Blank,
	Exclamation,
	Question,
	Sound,
	Weird,
	Talk,
	Check
	
}

global.gestures=
[
    spr_gesture_icon00,
	spr_gesture_icon01,
	spr_gesture_icon02,
	spr_gesture_icon03,
	spr_gesture_icon04,
	spr_gesture_icon05,
	spr_gesture_icon06,
	
]
function set_gesture(_obj,_gesture)
{
	if(instance_exists(_obj))
	{
		var _x			=	_obj.x;
		var _y			=	_obj.bbox_top;
		var _depth		=	_obj.depth-1;
	
		var _emoticon =	instance_create_depth(_x,_y,_depth,obj_gesture);

		_emoticon.gesture=_gesture;
		var _char = instance_nearest(_x,_y,_obj);
		_emoticon.char_follow=_char;
		return _emoticon
	}
	else
	{
	    show_debug_message("obj_gesture: no se encuentra objeto a cual darle emoticon")
		return -1;
	}
	
}