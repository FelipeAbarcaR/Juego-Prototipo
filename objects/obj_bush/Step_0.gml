/// @description Insert description here
// You can write your code in this editor

var _obj=o_player;
if(instance_exists(_obj))
{
	if(place_meeting(x,y,_obj)) //_obj.x,_obj.y,id
	{
		if (global.beat==true)
		{
			imagexscale*=(-1);
		}
	} else imagexscale=1;
};
