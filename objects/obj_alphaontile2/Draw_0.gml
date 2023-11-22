/// @description Insert description here
// You can write your code in this editor


// Draw tiles in the surface
if (!surface_exists(surf)) {
    surf = surface_create(width, height);
}

surface_set_target(surf);

var _alpha_lay_id	=	layer_get_id("Alpha");
var _alpha_tilemap	=	layer_tilemap_get_id(_alpha_lay_id);

for (var _i=0;_i<array_length(tilemap_array);_i++)
{
	var _tile_set = tileset_array[_i];
	var _tile_data= tile_data_array[_i];
	
	for (var y_offset = 0; y_offset < tiles_height; y_offset++) {
	    for (var x_offset = 0; x_offset < tiles_lenght; x_offset++) {
       
			var _alpha_tile	=	tilemap_get_at_pixel(_alpha_tilemap, x + x_offset * TILE_SIZE,y + y_offset * TILE_SIZE);
			if(_alpha_tile)
			{
				// Store tiledata
		        var __tiledata	= _tile_data[x_offset][y_offset];	
				// draw tile
		        draw_tile(_tile_set, __tiledata, 0, x_offset * 16, y_offset * 16);
			}
		}
	}
}

gpu_set_colorwriteenable(false,false,false,true);
gpu_set_blendmode_ext(bm_zero,bm_inv_src_color);
gpu_set_alphatestenable(true);
draw_sprite_ext(spr_flashlight,1,max(o_player.x-x,0),max(o_player.y-y,0),1.2,1.2,0,c_white,alpha_tile);
gpu_set_colorwriteenable(true,true,true,true);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);  

surface_reset_target();

draw_surface(surf,x,y);

//surface_free(surf);

if(global.DrawText)
{
	draw_circle(x,y,3,0);
	draw_line(x,y,x+width,y);
	draw_line(x,y,x,y+height);
	draw_line(x+width,y,x+width,y+height);
	draw_line(x,y+height,x+width,y+height);

}


