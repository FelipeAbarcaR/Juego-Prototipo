// Step Event code of obj_alphaontile

var _margin=32; //margen de destruirse antes de tocar el borde de lo "dibujado" 
var _inthebox=collision_rectangle(x+_margin,y+_margin,x+width-_margin,y+height-_margin,o_player,0,0);

if(_inthebox==noone)
{
	show_debug_message("obj_alphaontile destruido");
	instance_destroy();
}
