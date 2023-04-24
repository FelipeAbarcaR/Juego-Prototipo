/// @description Progress Transition
//BEGIN STEP pasa antes que STEP

with(obj_player) 
{
	if(state != PlayerStateDead) state = PlayerStateTransition;
}

if(leading == OUT)
{
	//se ocupa en min para que la suma no pase del 1
	percent = min(1, percent + TRANSITION_SPEED);
	//si la pantalla esta totalmente oscurecida
	if(percent >= 1) 
	{
		room_goto(target);
		leading = IN;
	}
}
else //leading == IN
{
	percent = max(0, percent - TRANSITION_SPEED);
	//si la pantalla es totalmente aclarecida
	if(percent <= 0)
	{
		with(obj_player) state = PlayerStateFree;
		instance_destroy();
	}
}	