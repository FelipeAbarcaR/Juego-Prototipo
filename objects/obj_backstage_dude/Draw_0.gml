/// @description Insert description here
// You can write your code in this editor

var _tile_size=TILE_SIZE;
var _row_start=map[current_row][0];
var _row_width=map[current_row][1];

for(var i=_row_start;i<=_row_start+_row_width;i++)
{
	var _tile_map;
	if (i==_row_start) _tile_map=623;
	if(i>_row_start) _tile_map=624;
	if(i==_row_start+_row_width) _tile_map=625;
    draw_tile(cinema_tileset,_tile_map,0,x+i*_tile_size,y+current_row*_tile_size);
	
	draw_circle(x+i*_tile_size,y,4,false);
}


for(var _i=0;_i<current_row;_i++)
{
	for(var _t=0;_t<=tiles_width;_t++)
	{
		var _tilemap1=tilemap_get_at_pixel(tilemap1,x+_t*_tile_size,y+_i*_tile_size);
		var _tilemap2=tilemap_get_at_pixel(tilemap2,x+_t*_tile_size,y+_i*_tile_size);
		draw_tile(cinema_tileset,_tilemap1,0,x+_t*_tile_size,y+_i*_tile_size);
		draw_tile(cinema_tileset,_tilemap2,0,x+_t*_tile_size,y+_i*_tile_size);
	}
    
}
draw_circle(x,y,5,false);




