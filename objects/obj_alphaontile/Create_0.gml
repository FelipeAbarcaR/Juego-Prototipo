/// @description Insert description here
// You can write your code in this editor

tiles_lenght=8;
tiles_height=8;
width=tiles_lenght*TILE_SIZE;
height=tiles_height*TILE_SIZE;

surf=-1;
surf=surface_create(width,height);


//set x and y position
var _player=o_player;
x= _player.x-(width/2) - (_player.x mod TILE_SIZE);
y= _player.y-(height/2) - (_player.y mod TILE_SIZE);

lay_id_1 = layer_get_id("solid_base");			//trees
lay_id_2 = layer_get_id("solid_base_deco");		//upper_trees
lay_id_3 = layer_get_id("solid_mountain");		//mountain 1st floor
lay_id_4 = layer_get_id("solid_mid_mountain");		//mountain 1st floor
lay_id_5 = layer_get_id("solid_top_mountain");		//mountain 1st floor


//create a grid map to store actual tiles
tile_data_upper			=	ds_grid_create(tiles_lenght, tiles_height); // Create a 2D grid to store tile data
tile_data_upper2		=	ds_grid_create(tiles_lenght, tiles_height);
tile_data_mountain_1	=	ds_grid_create(tiles_lenght, tiles_height);
tile_data_mountain_2	=	ds_grid_create(tiles_lenght, tiles_height);
tile_data_mountain_3	=	ds_grid_create(tiles_lenght, tiles_height);

//declare tilemaps
tilemap_lower	 = layer_tilemap_get_id(lay_id_1); // Adjust the layer name
tilemap_upper	 = layer_tilemap_get_id(lay_id_2);
tilemap_m1		 = layer_tilemap_get_id(lay_id_3);
tilemap_m2		 = layer_tilemap_get_id(lay_id_4);
tilemap_m3		 = layer_tilemap_get_id(lay_id_5);

//tilesets
tile_set			= tilemap_get_tileset(tilemap_lower);
tile_set_mountain	= tilemap_get_tileset(tilemap_m1);

var _td_up1,_td_up2,_td_mo1,_td_mo2,_td_mo3;
_td_up1	=	ds_grid_create(tiles_lenght,tiles_height);
_td_up2	=	ds_grid_create(tiles_lenght,tiles_height);
_td_mo1	=	ds_grid_create(tiles_lenght,tiles_height);
_td_mo2	=	ds_grid_create(tiles_lenght,tiles_height);
_td_mo3	=	ds_grid_create(tiles_lenght,tiles_height);

var _tile_data_array = 
[
	_td_up1,
	_td_up2,
	_td_mo1,
	_td_mo2,
	_td_mo3
];

var _tile_data_array_full = 
[
	tile_data_upper		,	
	tile_data_upper2	,
	tile_data_mountain_1,
	tile_data_mountain_2,
	tile_data_mountain_3
];

var _tileset_array_full =
[
	tile_set,
	tile_set,
	tile_set_mountain,
	tile_set_mountain,
	tile_set_mountain
];

var _tilemaps_array = 
[
	tilemap_lower,
	tilemap_upper,	
	tilemap_m1,		
	tilemap_m2,
	tilemap_m3		
];

tilemap_array=[];
tile_data_array=[];
tileset_array=[];

var _alpha_lay_id=layer_get_id("Alpha");
var _alpha_tilemap=layer_tilemap_get_id(_alpha_lay_id);

for(var _i =  0; _i <array_length(_tile_data_array);_i++)
{
	var _tile_data=_tile_data_array[_i];	
	var _tilemap=_tilemaps_array[_i];
		
	if(_tilemap!=-1) //if tilemap exists
	{
		for (var y_offset = 0; y_offset < tiles_height; y_offset++) 
		{
			for (var x_offset =	0; x_offset < tiles_lenght; x_offset++) 
			{
				var _alpha_tile=tilemap_get_at_pixel(_alpha_tilemap, x + x_offset * TILE_SIZE,y + y_offset * TILE_SIZE);
				if(_alpha_tile)
				{
			        _tile_data[# x_offset, y_offset] = tilemap_get_at_pixel(_tilemap, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);
	   
			        // Set those tiles to empty
		
			        tilemap_set_at_pixel(_tilemap, 0, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); // Clear tile
				}
			}
		}		
		
		array_push(tilemap_array,_tilemap);
		ds_grid_copy(_tile_data_array_full[_i],_tile_data);
		array_push(tile_data_array,_tile_data_array_full[_i]);
		array_push(tileset_array,_tileset_array_full[_i]);
	}
}


ds_grid_destroy(_td_up1);
ds_grid_destroy(_td_up2);
ds_grid_destroy(_td_mo1);
ds_grid_destroy(_td_mo2);
ds_grid_destroy(_td_mo3);

_td_up1	=	-1;
_td_up2	=	-1;
_td_mo1	=	-1;
_td_mo2	=	-1;
_td_mo3	=	-1;



alpha_tile=0.35;