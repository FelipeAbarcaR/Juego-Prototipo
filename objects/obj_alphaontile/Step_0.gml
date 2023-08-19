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
		draw_tile(tile_set, _tiledata2, 0, x_offset * 16, y_offset * 16);
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

var _inthebox=collision_rectangle(x,y,x+width,y+height,o_player,0,0);


if(_inthebox==noone) instance_destroy();

; 