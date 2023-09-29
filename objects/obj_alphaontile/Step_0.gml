// Step Event code of obj_alphaontile

var _inthebox=collision_rectangle(x,y,x+width,y+height,o_player,0,0);

if(_inthebox==noone)
{
	show_debug_message("obj_alphaontile destruido");
	instance_destroy();
}
