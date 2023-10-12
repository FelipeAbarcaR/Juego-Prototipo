/// @description Insert description here
// You can write your code in this editor

if(instance_exists(o_player))
{
    var _collision=place_meeting(self.x,self.y,o_player);
	if(_collision)
	{
	    global.cryptroom=id;
		if(o_player.state=states.AUTOMOVING)
		{
		    instance_deactivate_object(crypt_room_gate);
		}
	}
}




