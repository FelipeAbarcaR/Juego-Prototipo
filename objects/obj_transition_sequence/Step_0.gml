/// @description Insert description here
// You can write your code in this editor

if(transition_ended) instance_destroy();

if(transition_out_ended)
{
	transition_out_ended=false;
    alarm[0]=room_speed*time_transition_in;
}