/// @description Insert description here
// You can write your code in this editor

tiles_lenght=8;
tiles_height=8;
width=tiles_lenght*TILE_SIZE;
height=tiles_height*TILE_SIZE;

surf=-1;
surf=surface_create(width,height);

// set x and y position
var _player=o_player;
x= _player.x-(width/2) - (_player.x mod TILE_SIZE);
y= _player.y-(height/2) - (_player.y mod TILE_SIZE);

var layer_names = 
[
	"solid_base",
	"solid_base_deco",
	"solid_mountain",
	"solid_mid_mountain",
	"solid_top_mountain",
	"solid_base_city",
	"solid_base_city_deco"
	
];
var num_layers = array_length(layer_names);

tilemap_array = [];
tile_data_array = [];
tileset_array = [];

var alpha_lay_id = layer_get_id("Alpha");
var alpha_tilemap = layer_tilemap_get_id(alpha_lay_id);

for (var i = 0; i < num_layers; i++) {
    
    var layer_name = layer_names[i];
    
    var _layer_exists=layer_exists(layer_name);
    
    if(_layer_exists)
    {
        var lay_id = layer_get_id(layer_name);
        var tilemap = layer_tilemap_get_id(lay_id);
        var _tile_data = [];
        for (var j = 0; j < tiles_lenght; j++) {
            _tile_data[j] = array_create(tiles_height);
        }
        
        for (var y_offset = 0; y_offset < tiles_height; y_offset++) {
            for (var x_offset = 0; x_offset < tiles_lenght; x_offset++) {
                var _alpha_tile = tilemap_get_at_pixel(alpha_tilemap, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);

                if (_alpha_tile) {
                    _tile_data[x_offset][y_offset] = tilemap_get_at_pixel(tilemap, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);
                    tilemap_set_at_pixel(tilemap, 0, x + x_offset * TILE_SIZE, y + y_offset * TILE_SIZE);
                }
            }
        }

        array_push(tilemap_array, tilemap);
        array_push(tileset_array, tilemap_get_tileset(tilemap));
        array_push(tile_data_array, _tile_data);
    }
}

alpha_tile = 0.35;
