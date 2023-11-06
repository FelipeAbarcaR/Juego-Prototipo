/// @description Insert description here
// You can write your code in this editor

if(instance_exists(o_player))
{
    o_player.inmunity=true;
}
if(instance_exists(obj_obs_player))
{
    obj_obs_player.invulnerable=true;
}

if(global.beat)
{
    active_time--;
	if(active_time<=0)
	{
	    instance_destroy();
	}
}







