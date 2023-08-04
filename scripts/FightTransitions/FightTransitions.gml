

//Called whenever you want to fight arena, using any combination of in/out sequences
function FightTransitionStart(_roomBG, _typeOut, _typeIn)
{
	if (!global.midTransition)
	{
		global.midTransition = true;
		global.fightBackground=_roomBG;
		FightTransitionPlaceSequence(_typeOut);
		global.transition_in_type=_typeIn;
		return true;
		
	}
	else return false
}

//Places the sequences in the room
function FightTransitionPlaceSequence(_type)
{
	if (layer_exists("transition")) layer_destroy("transition")
	var _lay = layer_create(-9999,"transition")
	global.sequencetransitionid=layer_sequence_create(_lay,x,y,_type);
}

function FightTransitionReturn(_typeOut,_typeIn)
{
	if (!global.midTransition)
	{
		global.midTransition = true;
		FightTransitionPlaceSequence(_typeOut);
		global.transition_in_type=_typeIn;
		fight_status=fighting.ending;
		return true;
		
	}
	else return false
}

//Called as a moment at the end of an "Out" transition sequence
function FightTransitionChangeBG()
{	
	if(obj_fight_control.fight_status==fighting.starting)
	{
		with(obj_fight_control)
		{
		    draw_background=true;
			create_fighters=true;
			//set timer to start transition IN
			alarm[2]=room_speed * time_transition_in;
		
		}
	}
	
	if(obj_fight_control.fight_status==fighting.ending)
	{
		with(obj_fight_control)
			{
				draw_background=false;
				destroy_fighters=true;
				//set timer to start transition IN
				alarm[2]=room_speed * time_transition_in;
		
			}
	}
}

//Called as a moment at the end of an "In" transition sequence
function FightTransitionFinished()
{
	layer_sequence_destroy(global.sequencetransitionid);
	layer_sequence_destroy(self.elementID);
	global.midTransition = false;
	global.sequencetransitionid =undefined;
	;
	if (obj_fight_control.fight_status==fighting.ending)
	{
	    global.fight_ended=true;
		instance_destroy(obj_fight_control);
		
	}
}


