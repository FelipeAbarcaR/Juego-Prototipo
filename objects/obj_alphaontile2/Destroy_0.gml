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
				tilemap_set_at_pixel(_tilemap, _tile_data[x_offset][y_offset], x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); 
			}
		}
	}

	tile_data_array[_i]=-1;
}


