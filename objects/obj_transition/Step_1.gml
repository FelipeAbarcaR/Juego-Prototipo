/// @description Progress Transition
//BEGIN STEP pasa antes que STEP

with(o_player) 
{
	if(state != states.DEAD)
	{
		
		state = states.IDLE;
	}
}

if(leading == OUT)
{
	audio_pause_all();
	//se ocupa en min para que la suma no pase del 1
	percent = min(1, percent + TRANSITION_SPEED);
	//si la pantalla esta totalmente oscurecida
	if(percent >= 1) 
	{
		room_goto(global.targetRoom)
		leading = IN;
	}
}
else //leading == IN
{
	percent = max(0, percent - TRANSITION_SPEED);
	//si la pantalla es totalmente aclarecida
	if(percent <= 0)
	{
		with(o_player) state = states.IDLE;
		instance_destroy();
	}
}	

