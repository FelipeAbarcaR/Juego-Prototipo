global.roomTarget = -1;
global.midTransition = false;
global.transition_out_type=-1;
global.transition_in_type=-1;
global.transition_in_start=false;
global.transition_time=-1;

//Called whenever you want to go from one room to another, using any combination of in/out sequences
function TransitionStart(_roomTarget,_type,_way=TR_WAY.TWOPASS, _time=2,_BGM=undefined)
{
	if(!global.midTransition)
	{
		//global.midTransition=true;
		global.roomTarget=_roomTarget;
		//global.transition_out_type=_typeOut;
		//global.transition_in_type=_typeIn;
		//global.transition_time=_time;

		//where is the left corner of the screen
		//(cambiar a gui para poner 0,0. o encontrar algo mejor)
		//var _x,_y;
		//if(instance_exists(oCameraManager))
		//{
		//    _x=camera_get_view_x(oCameraManager.camera);
		//	_y=camera_get_view_y(oCameraManager.camera);
		//}else
		//{
		//    _x=0;
		//	_y=0;
		//}
		////create the transition manager object
		var _transition = instance_create_depth(0,0,depth,obj_transition_manager);
	    _transition.transition_type=_type;
		_transition.transition_way=_way;
	
		////start fade out bgm
		//if(_BGM!=undefined)
		//{
		//    with obj_beat
		//	{
		//	    ChangeBGM(_BGM,_time,true)
		//	}
		//}
		
	} else
	{
		show_debug_message("TransitionStart(), already in transition");
	}
	

}


//Places the sequences in the room
function TransitionPlaceSequence(_type,_time=undefined)
{
	if (layer_exists("transition")) layer_destroy("transition");
	var _lay = layer_create(-9999,"transition");
	var _seq = layer_sequence_create(_lay,x,y,_type);
	
	var _time_string="";
	if(_time!=undefined)
	{
		var _struct = layer_sequence_get_instance(_seq);
	    _struct.speedScale=_time;
		_time_string=string(_time);
	}
	
	show_debug_message("sequence created, Element id: "+sequence_get(_type).name+_time_string);
	return _seq;
}

//Called as a moment at the end of an "Out" transition sequence
function TransitionChangeRoom()
{
	with (obj_transition_sequence)
	{
		draw_background_patch=true;
	    transition_out_ended=true;
	}

}

//Called as a moment at the end of an "In" transition sequence
function TransitionFinished()
{	
	//Destroy sequences ids
	var _seq_id = obj_transition_sequence.out_transition_id;
	
	if(sequence_exists(_seq_id))
	{
	    layer_sequence_destroy(_seq_id);
	}
	
	layer_sequence_destroy(self.elementID);
	
	global.midTransition						=	false; //the transition ended
	global.transition_in_start					=	false; //the sincronized transition in ended
	global.transition_sincronize_bgm			=	false; //stop sincronized transition with bgm	
	obj_transition_sequence.transition_ended	=	true;
}


function CheckSincronizedTransition()
{
	if(instance_exists(obj_transition_sequence))
	{
		var _bgm_ready=obj_beat.ready_to_transition_in;
		var _sequence_ready=obj_transition_sequence.ready_to_transition_in;
	    if (_bgm_ready && _sequence_ready)
		{
			changed_room=true;
			room_goto(global.roomTarget);
		    global.transition_in_start=true;
		}
	}
}


function TransitionResetValues()
{
    global.roomTarget = -1;
	global.midTransition = false;
	global.targetX=-1;
	global.targetY=-1;
	global.targetdirection=-1;
}