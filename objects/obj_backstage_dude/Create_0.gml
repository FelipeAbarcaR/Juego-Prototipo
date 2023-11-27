/// @description Insert description here
// You can write your code in this editor

tiles_width= 18;
tiles_height= 13;

map=
[
	[1,15],
	[1,14],
	[2,14],
	[5,11],
	[6,10],
	[2,16],
	[2,16],
	[5,11],
	[0,16],
	[0,15],
	[1,13],
	[5,9],
	[6,6]
]

current_row=0;

cinema_tileset=ts_Mapa1Cinematica1;

step_time=0;
step_speed=1;
step_reset=60;

show_debug_message("hola soy backstage_dude");

layer_id=layer_get_id("rumble_TEST");
layer_id2=layer_get_id("rumble_TEST2");

tilemap1=layer_tilemap_get_id(layer_id);
tilemap2=layer_tilemap_get_id(layer_id2);





