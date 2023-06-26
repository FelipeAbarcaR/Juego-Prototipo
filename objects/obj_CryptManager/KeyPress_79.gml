/// @description Insert description here
// You can write your code in this editor

if (danceactive==false)
{
    danceactive=true
	layer_set_visible(lay_id,true);
	layer_set_visible(obstacles_lay_id,true);
	instance_activate_layer(obstacles_lay_id);
	
} else {
	danceactive=false;
	layer_set_visible(lay_id,false);
	layer_set_visible(obstacles_lay_id,false);
	instance_deactivate_layer(obstacles_lay_id);
}

