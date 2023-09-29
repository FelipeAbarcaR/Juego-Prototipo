/// @description Insert description here
// You can write your code in this editor

for (var y_offset = 0; y_offset < tiles_height; y_offset++) {
    for (var x_offset = 0; x_offset < tiles_lenght; x_offset++) {
     
        // set the tiles to normal
        tilemap_set_at_pixel(tilemap_lower, tile_data_upper[# x_offset, y_offset], x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); 
        tilemap_set_at_pixel(tilemap_upper, tile_data_upper2[# x_offset, y_offset], x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);
		tilemap_set_at_pixel(tilemap_m1, tile_data_mountain_1[# x_offset, y_offset], x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); 
		tilemap_set_at_pixel(tilemap_m2, tile_data_mountain_2[# x_offset, y_offset], x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); 
		tilemap_set_at_pixel(tilemap_m3, tile_data_mountain_3[# x_offset, y_offset], x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);
	}
}
if (surface_exists(surf)) surface_free(surf);

ds_grid_destroy(tile_data_upper);
ds_grid_destroy(tile_data_upper2);

ds_grid_destroy(tile_data_mountain_1);
ds_grid_destroy(tile_data_mountain_2);
ds_grid_destroy(tile_data_mountain_3);


