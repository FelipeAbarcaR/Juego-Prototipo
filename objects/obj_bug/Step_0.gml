/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

//dance
var _frame=image_index;
if(global.beat)
{
	if(_frame+1>image_number-1)
	{
	    image_index=0;
	}else image_index=_frame+1;
}