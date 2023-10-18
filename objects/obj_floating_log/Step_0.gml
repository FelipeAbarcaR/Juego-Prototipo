/// @description Insert description here
// You can write your code in this editor

var _collision=place_meeting(self.x,self.y,o_player);
if(_collision)
{
	sprite_index=sprite_not_floating;
	timer=0;
	
} else 
{
    timer+=delta_time/1000000;
	if(timer>=time_limit)
	{
		sprite_index=sprite_floating;
	}
}



