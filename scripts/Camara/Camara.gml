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


function RoomTransition(_type,_targetroom){

	if(!instance_exists(obj_transition))
	{
		with(instance_create_depth(0,0,-9999,obj_transition))
		{
			typee = _type;
			target = _targetroom;
		}
	}
	else show_debug_message("Trying to transition while transition is happening");
	
}