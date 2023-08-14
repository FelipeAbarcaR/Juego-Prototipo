/// @description Insert description here
// You can write your code in this editor

if(global.beat){
	RotationRemaining=RotationRange;
}

var _xto = x+lengthdir_x(GridSpeed,Direction);
var _yto = y+lengthdir_y(GridSpeed,Direction)
if(collisionmap!=(-1))
{
	var _goingtoborder=tilemap_get_at_pixel(collisionmap,_xto,_yto)
	if (_goingtoborder)
	{
		Direction+=180;
	}
}
if(/*global.Move &&*/ global.beat){  //MOVE ES PARA ACTIVAR TODOS A MOVERSE
	state="move"
	DistanceRemaining=GridDistance;
}


States();
