/// @description Insert description here
// You can write your code in this editor

if(global.beat){
	RotationRemaining=RotationRange;
}

var xto = x+lengthdir_x(GridSpeed,Direction);
var yto = y+lengthdir_y(GridSpeed,Direction)

if (xto<0||xto>room_width) Direction+=180;
if (yto<0||yto>room_height) Direction+=180;

if(/*global.Move &&*/ global.beat){  //MOVE ES PARA ACTIVAR TODOS A MOVERSE
	state="move"
	DistanceRemaining=GridDistance;
}


States();
