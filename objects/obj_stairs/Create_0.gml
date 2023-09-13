/// @description Insert description here
// You can write your code in this editor

speed_decrease= 0.6;

effect=layer_get_fx("Fog_effect");
effect_params=fx_get_parameters(effect);
collided=false;

var _player=o_player;
player_speed=_player.walk_spd;
depth=_player.depth+1;