/// @description Insert description here
// You can write your code in this editor

lay_id = layer_get_id("CryptTiles");
map_id = layer_tilemap_get_id(lay_id);
room_lay_id=layer_get_id("CryptRooms");
obstacles_lay_id = layer_get_id("CryptObstacles");
range_lay_id=layer_get_id("CryptRange");	
tileindex=1;

danceactive=true;

global.cryptroom=-1;
hand_created=false;
hand_signal=false;


//tilemap_set(map_id, data, mx, my);


//deactivate objects and hide layers
//instance_deactivate_layer(obstacles_lay_id);
layer_set_visible(lay_id,true);
layer_set_visible(obstacles_lay_id,true);
layer_set_visible(range_lay_id,false);
layer_set_visible(room_lay_id,false);

if(instance_activated==false)
{
    instance_deactivate_object(object_index)
}