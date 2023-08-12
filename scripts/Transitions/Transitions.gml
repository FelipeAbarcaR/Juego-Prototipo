global.roomTarget = -1;
global.midTransition = false;
global.transition_out_type=-1;
global.transition_in_type=-1;

//Called whenever you want to go from one room to another, using any combination of in/out sequences
function TransitionStart(_roomTarget, _typeOut, _typeIn)
{
	global.targetRoom=_roomTarget;
	global.transition_out_type=_typeOut;
	global.transition_in_type=_typeIn;
	
	//create the transition manager object
	var _x,_y;
	if(instance_exists(oCameraManager))
	{
	    _x=camera_get_view_x(oCameraManager.camera);
		_y=camera_get_view_y(oCameraManager.camera);
	}else
	{
	    _x=0;
		_y=0;
	}
	
	instance_create_depth(_x,_y,depth,obj_transition_sequence);
}


function TransitionBegin(_roomTarget, _typeOut)
{
	if (!global.midTransition)
	{
		global.midTransition = true;
		global.roomTarget = _roomTarget;
		TransitionPlaceSequence(_typeOut);
		return true;
	}
	else	{
		show_debug_message("Intentando comenzar una transición cuando ya está en mid transition");
		return false;
	}
}

//Places the sequences in the room
function TransitionPlaceSequence(_type)
{
	if (layer_exists("transition")) layer_destroy("transition");
	var _lay = layer_create(-9999,"transition");
	var _seq = layer_sequence_create(_lay,x,y,_type);

	obj_transition_sequence.out_transition_id	=	_seq;
	show_debug_message("sequence create with id: "+string(_seq)+", type: "+string(_type));	
}

//Called as a moment at the end of an "Out" transition sequence
function TransitionChangeRoom()
{
	room_goto(global.roomTarget);
	with (obj_transition_sequence)
	{
		draw_background_patch=true;
	    transition_out_ended=true;
	}

}

//Called as a moment at the end of an "In" transition sequence
function TransitionFinished()
{
	var _seq_id = obj_transition_sequence.out_transition_id;
	
	if(sequence_exists(_seq_id))
	{
	    layer_sequence_destroy(_seq_id);
	}
	
	layer_sequence_destroy(self.elementID);
	global.midTransition = false;
	obj_transition_sequence.transition_ended=true;
}

