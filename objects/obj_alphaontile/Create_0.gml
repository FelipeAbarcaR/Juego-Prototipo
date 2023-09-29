/// @description Insert description here
// You can write your code in this editor

tiles_lenght=16;
tiles_height=10;
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
tile_data_upper = ds_grid_create(tiles_lenght, tiles_height); // Create a 2D grid to store tile data
tile_data_upper2 = ds_grid_create(tiles_lenght, tiles_height); // Create a 2D grid to store tile data
tile_data_mountain_1 = ds_grid_create(tiles_lenght, tiles_height);
tile_data_mountain_2 = ds_grid_create(tiles_lenght, tiles_height);
tile_data_mountain_3 = ds_grid_create(tiles_lenght, tiles_height);

//declare tilemaps
tilemap_lower	 = layer_tilemap_get_id(lay_id_1); // Adjust the layer name
tilemap_upper	 = layer_tilemap_get_id(lay_id_2);
tilemap_m1		 = layer_tilemap_get_id(lay_id_3);
tilemap_m2		 = layer_tilemap_get_id(lay_id_4);
tilemap_m3		 = layer_tilemap_get_id(lay_id_5);

//tilesets
tile_set			= tilemap_get_tileset(tilemap_lower);
tile_set_mountain	= tilemap_get_tileset(tilemap_m1);

for (var y_offset = 0; y_offset < tiles_height; y_offset++) {
    for (var x_offset = 0; x_offset < tiles_lenght; x_offset++) {
        
		// Store tile in local variable for upper and upperupper layer
        tile_data_upper[# x_offset, y_offset] = tilemap_get_at_pixel(tilemap_lower, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);
        tile_data_upper2[# x_offset, y_offset] = tilemap_get_at_pixel(tilemap_upper, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);
		// same for mountain floors
		tile_data_mountain_1[# x_offset, y_offset] = tilemap_get_at_pixel(tilemap_m1, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);
		tile_data_mountain_2[# x_offset, y_offset] = tilemap_get_at_pixel(tilemap_m2, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);
		tile_data_mountain_3[# x_offset, y_offset] = tilemap_get_at_pixel(tilemap_m3, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);
		
        // Set those tiles to empty
        tilemap_set_at_pixel(tilemap_lower, 0, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); // Clear tile
        tilemap_set_at_pixel(tilemap_upper, 0, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); // Clear tile
		
		tilemap_set_at_pixel(tilemap_m1, 0, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); // Clear tile
		tilemap_set_at_pixel(tilemap_m2, 0, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); // Clear tile
		tilemap_set_at_pixel(tilemap_m3, 0, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); // Clear tile
	}
}

alpha_tile=0.35;