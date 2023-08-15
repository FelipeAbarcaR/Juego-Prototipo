/// @description Insert description here
// You can write your code in this editor

if(transition_ended) 
{
	
	TransitionResetValues();
    instance_destroy();
	obj_beat.new_speed_transition=-1;
	obj_beat.wait_for_signal=false;
}

//Change Room and wait for transition in
if(transition_out_ended)
{
	transition_out_ended=false;
    alarm[0]=room_speed*mid_transition_time;
}

if(ready_to_transition_in)
{
	TransitionPlaceSequence(transition_type_in,sequence_time);
	ready_to_transition_in=false;
	alarm[1]=room_speed*0.1;
}
