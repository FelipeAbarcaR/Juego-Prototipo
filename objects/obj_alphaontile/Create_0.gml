/// @description Insert description here
// You can write your code in this editor

tiles_lenght=30;
tiles_height=10;
width=tiles_lenght*TILE_SIZE;
height=tiles_height*TILE_SIZE;

surf=-1;
surf=surface_create(width,height);


upper_lay_id	=	layer_get_id("TilesUpper");
upper2_lay_id	=	layer_get_id("TilesUpperUpper")


lay_id1 = layer_get_id("TilesUpper");
lay_id2 = layer_get_id("TilesUpperUpper");
tile_data_upper = ds_grid_create(tiles_lenght, tiles_height); // Create a 2D grid to store tile data
tile_data_upper2 = ds_grid_create(tiles_lenght, tiles_height); // Create a 2D grid to store tile data
tilemap_lower = layer_tilemap_get_id(lay_id1); // Adjust the layer name
tilemap_upper = layer_tilemap_get_id(lay_id2); // Adjust the layer name
tile_set = tilemap_get_tileset(tilemap_lower);

for (var y_offset = 0; y_offset < tiles_height; y_offset++) {
    for (var x_offset = 0; x_offset < tiles_lenght; x_offset++) {
        // Store rectangle in local variable for upper and upperupper layer
        tile_data_upper[# x_offset, y_offset] = tilemap_get_at_pixel(tilemap_lower, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);
        tile_data_upper2[# x_offset, y_offset] = tilemap_get_at_pixel(tilemap_upper, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);

        // Set those tiles to empty
        tilemap_set_at_pixel(tilemap_lower, 0, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); // Clear tile
        tilemap_set_at_pixel(tilemap_upper, 0, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE); // Clear tile
    }
}
if (!surface_exists(surf)) {
    surf = surface_create(width, height);
}

surface_set_target(surf);
for (var y_offset = 0; y_offset < tiles_height; y_offset++) {
    for (var x_offset = 0; x_offset < tiles_lenght; x_offset++) {
        // Store rectangle in local variable for upper and upperupper layer
        var _tiledata = tile_data_upper[# x_offset, y_offset];
		var _tiledata2 = tile_data_upper2[# x_offset, y_offset];
        draw_tile(tile_set, _tiledata, 0, x_offset * 16, y_offset * 16);
		draw_tile(tile_set, _tiledata2, 0, x_offset * 16, y_offset * 16);
    }
}
surface_reset_target();

alpha_tile=0.35;