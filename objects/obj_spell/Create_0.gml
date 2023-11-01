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

