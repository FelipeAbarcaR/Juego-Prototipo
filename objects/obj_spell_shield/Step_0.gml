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

if(instance_exists(obj_crypt_player))
{
    obj_crypt_player.inmunity=true;
}

if(global.beat)
{
    active_time--;
	if(active_time<=0)
	{
	    minimize_to_destroy=true
		play_sfx(sfx_shield_out);
	}
}

if(minimize_to_destroy)
{
	if(sprite_scale<=0) instance_destroy(); 
}






