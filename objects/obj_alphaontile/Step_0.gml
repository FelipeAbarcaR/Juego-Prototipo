// Step Event code of obj_alphaontile


// Draw those tiles in the surf
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
		//gpu_set_blendmode(bm_add);
		draw_tile(tile_set, _tiledata2, 0, x_offset * 16, y_offset * 16);
		gpu_set_blendmode(bm_subtract);
		draw_circle_color(max(o_player.x-x),max(o_player.y-y),32,c_gray,c_lime,false);
		gpu_set_blendmode(bm_normal);
		draw_sprite(spr_flashlight,0,max(o_player.x-x,0),max(o_player.y-y,0));
    }
}
surface_reset_target();
var _inthebox=collision_rectangle(x,y,x+width,y+height,o_player,0,0)

if(_inthebox==noone) instance_destroy();