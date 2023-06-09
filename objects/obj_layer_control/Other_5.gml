/// @description clean up grid and layers
for (var i = 0; i < global.GRID_H; i++)
{
	layer_destroy(global.layergrid[# 0,i]);
}

if(ds_exists(global.layergrid,ds_type_grid))
{
	ds_grid_destroy(global.layergrid);
}