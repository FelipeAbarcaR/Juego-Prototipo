/// @description Insert description here
// You can write your code in this editor

if(screen_transition_exists(bg_transition))
{
	screen_transition_destroy(bg_transition,true);
}
if(instance_exists(o_player))
{
    o_player.state=states.MOVE;
}








