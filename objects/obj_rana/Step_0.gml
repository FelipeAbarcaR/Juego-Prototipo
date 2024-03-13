/// @description Insert description here
// You can write your code in this editor


var _player = collision_rectangle(x1_check+14,y1_check,x2_check,y2_check,o_player,false,true)

// Inherit the parent event
event_inherited();


if(_player && !detected)
{
	detected=true;
    instance_create_depth(x,y,depth-1,obj_cutscene);
}	