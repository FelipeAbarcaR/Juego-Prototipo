/// @description Insert description here
// You can write your code in this editor

for (var y_offset = 0; y_offset < tiles_height; y_offset++) {
    for (var x_offset = 0; x_offset < tiles_lenght; x_offset++) {
     
        // set the tiles to normal
        tilemap_set_at_pixel(tilemap_lower, tile_data_upper[# x_offset, y_offset], x + x_offset * 16, y + y_offset * 16); // Clear tile
        tilemap_set_at_pixel(tilemap_upper, tile_data_upper2[# x_offset, y_offset], x + x_offset * 16, y + y_offset * 16); // Clear tile
    }
}