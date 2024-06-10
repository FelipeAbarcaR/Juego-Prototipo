/// @description Insert description here
// You can write your code in this editor

spell_cooldown=3;
actual_cooldown=0;

spell_active_time=3;
active_time=spell_active_time;

player=-1;

if(instance_exists(o_player))			player=o_player;
if(instance_exists(obj_crypt_player))	player=obj_crypt_player;
if(instance_exists(obj_obs_player))		player=obj_obs_player;
if(instance_exists(obj_fight_gato))		player=obj_fight_gato;

if(player!=-1)
{
	var _p=player;
    var _inst=instance_create_depth(_p.x,_p.y-10,_p.depth,obj_vanish)
	_inst.sprite_index=self.sprite_index;
	_inst.image_xscale=0.25;
	_inst.image_yscale=0.25;
	_inst.image_index=self.image_index;
	_inst.vanish=0.02;
	_inst.vspeed=-0.6;
}