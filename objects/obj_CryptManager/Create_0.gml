/// @description Insert description here
// You can write your code in this editor

lay_id = layer_get_id("CryptTiles");
map_id = layer_tilemap_get_id(lay_id);
obstacles_lay_id = layer_get_id("CryptObstacles");
range_lay_id=layer_get_id("CryptRange");	
tileindex=1;

danceactive=false;


//tilemap_set(map_id, data, mx, my);


//deactivate objects and hide layers
instance_deactivate_layer(obstacles_lay_id);
layer_set_visible(lay_id,false);
layer_set_visible(obstacles_lay_id,false);
layer_set_visible(range_lay_id,false);