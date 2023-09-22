/// @description Insert description here
// You can write your code in this editor
if(transition_start)
{
	transition_start=false;
	
	var _callout=function()
	{
	    ready=true;
		room_goto(global.roomTarget);
		show_debug_message("obj_transition_manager: terminado y destruyendose");
	}

	transition=screen_transition(transition_type,transition_way,0,transition_colour,_callout);
	transition_progress=0;
	show_debug_message("obj_transition_manager: transición empezando ando");

}

if(screen_transition_exists(transition))
{
	transition_progress= screen_transition_get_progress(transition);
	var _tp=transition_progress;
	
	if(_tp>=0.5 and !middle_of_transition)
	{
	    middle_of_transition=true;
		
	}
	
	show_debug_message(string(_tp));
	if(_tp==1)
	{
		TransitionResetValues();
		screen_transition_destroy(transition, true);
	    instance_destroy();
	}
}




