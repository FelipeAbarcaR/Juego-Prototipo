/// @description Insert description here
// You can write your code in this editor

var _alpha_lay_id	=	layer_get_id("Alpha");
var _alpha_tilemap	=	layer_tilemap_get_id(_alpha_lay_id);

for (var _i=0;_i<array_length(tilemap_array);_i++)
{
	var _tilemap =tilemap_array[_i];
	var _tile_data= tile_data_array[_i];
	
	for (var y_offset = 0; y_offset < tiles_height; y_offset++) 
	{
	    for (var x_offset = 0; x_offset < tiles_lenght; x_offset++) 
		{
			var _alpha_tile=tilemap_get_at_pixel(_alpha_tilemap, x + x_offset * TILE_SIZE,y + y_offset * TILE_SIZE);    
	        if(_alpha_tile)
			{
				// set the tiles to normal
				tilemap_set_at_pixel(_tilemap, _tile_data[# x_offset, y_offset], x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); 
			}
		}
	}
	ds_grid_destroy(tile_data_array[_i]);
	tile_data_array[_i]=-1;
}


if(ds_exists(tile_data_upper,ds_type_grid))			ds_grid_destroy(tile_data_upper);
if(ds_exists(tile_data_upper2,ds_type_grid))		ds_grid_destroy(tile_data_upper2);
if(ds_exists(tile_data_mountain_1,ds_type_grid))	ds_grid_destroy(tile_data_mountain_1);
if(ds_exists(tile_data_mountain_2,ds_type_grid))	ds_grid_destroy(tile_data_mountain_2);
if(ds_exists(tile_data_mountain_3,ds_type_grid))	ds_grid_destroy(tile_data_mountain_3);

tile_data_upper			=-1;
tile_data_upper2		=-1;
tile_data_mountain_1	=-1;
tile_data_mountain_2	=-1;
tile_data_mountain_3	=-1;

