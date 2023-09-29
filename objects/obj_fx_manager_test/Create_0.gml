/// @description Insert description here
// You can write your code in this editor

//this set the 2nd floor of the mountain an fx
//this effect is in fx_mid_mountain layer

var _fx_layer=layer_get_fx("fx_mid_mountain");
//var _fog_params=fx_get_parameters(_fx_layer);
fx_set_single_layer(_fx_layer, true);
var _mountain_layer=layer_get_id("solid_mid_mountain");

layer_set_fx(_mountain_layer,_fx_layer);

