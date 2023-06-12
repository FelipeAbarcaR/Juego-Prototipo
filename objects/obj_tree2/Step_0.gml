/// @description Insert description here
// You can write your code in this editor

var _obj=o_player;
if(position_meeting(_obj.x,_obj.y,id))
{
	image_alpha=max(image_alpha-0.04,0.25)
}else
{
	image_alpha=min(image_alpha+0.04,1.00)
}