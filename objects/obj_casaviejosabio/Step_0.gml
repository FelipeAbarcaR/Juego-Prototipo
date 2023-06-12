/// @description Insert description here
// You can write your code in this editor

var _obj=o_player;
if(place_meeting(x,y,_obj)) //_obj.x,_obj.y,id
{
	image_alpha=max(image_alpha-0.04,maxalpha)
}else
{
	image_alpha=min(image_alpha+0.04,1.00)
}