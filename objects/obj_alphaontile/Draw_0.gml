/// @description Insert description here
// You can write your code in this editor

var _data_1=ds_grid_create(tiles_lenght, tiles_height);
var _data_2=ds_grid_create(tiles_lenght, tiles_height);
var _data_3=ds_grid_create(tiles_lenght, tiles_height);
var _data_4=ds_grid_create(tiles_lenght, tiles_height);
var _data_5=ds_grid_create(tiles_lenght, tiles_height);

ds_grid_copy(_data_1,tile_data_upper);
ds_grid_copy(_data_2,tile_data_upper2);
ds_grid_copy(_data_3,tile_data_mountain_1);
ds_grid_copy(_data_4,tile_data_mountain_2);
ds_grid_copy(_data_5,tile_data_mountain_3);

// Draw tiles in the surface
if (!surface_exists(surf)) {
    surf = surface_create(width, height);
}

surface_set_target(surf);
for (var y_offset = 0; y_offset < tiles_height; y_offset++) {
    for (var x_offset = 0; x_offset < tiles_lenght; x_offset++) {
        // Store rectangle in local variable for upper and upperupper layer
        var _tiledata	= _data_1[# x_offset, y_offset];
		var _tiledata2	= _data_2[# x_offset, y_offset];
		var _tiledata3	= _data_3[# x_offset, y_offset];
		var _tiledata4	= _data_4[# x_offset, y_offset];
		var _tiledata5	= _data_5[# x_offset, y_offset];
		
        draw_tile(tile_set, _tiledata, 0, x_offset * 16, y_offset * 16);
		draw_tile(tile_set, _tiledata2, 0, x_offset * 16, y_offset * 16);
		
		draw_tile(tile_set_mountain, _tiledata3, 0, x_offset * 16, y_offset * 16);
		draw_tile(tile_set_mountain, _tiledata4, 0, x_offset * 16, y_offset * 16);
		draw_tile(tile_set_mountain, _tiledata5, 0, x_offset * 16, y_offset * 16);
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

ds_grid_destroy(_data_1);
ds_grid_destroy(_data_2);
ds_grid_destroy(_data_3);
ds_grid_destroy(_data_4);
ds_grid_destroy(_data_5);

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


