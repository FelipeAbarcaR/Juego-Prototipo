function ScreenShake(_magnitude,_length){
	with(global.icamara)
	{
		if(_magnitude > shakeremain)
		{
			shakemagnitude = _magnitude;
			shakeremain = shakemagnitude;
			shakelength = _length;
		}
	}
}

//Esta funcion reemplazara room_goto
function RoomTransition(_type,_targetroom){
/// @desc RoomTransition (type, targetroom)
/// @arg Type 
/// @arg Targetroom

	if(!instance_exists(obj_transition))
	{
		with(instance_create_depth(0,0,-9999,obj_transition))
		{
			type = _type;
			target = _targetroom;
		}
	}
	else show_debug_message("Trying to transition while transition is happening");
	
}