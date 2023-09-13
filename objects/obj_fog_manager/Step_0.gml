/// @description Insert description here
// You can write your code in this editor

var _player=o_player;

if(instance_exists(_player))
{
    if(distance_to_object(_player)<fog_active_distance)
	{
	    layer_set_visible(layer_fog,1);
	}else layer_set_visible(layer_fog,0);
}
