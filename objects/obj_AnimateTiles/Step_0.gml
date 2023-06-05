/// @description check odd tiles and change
// You can write your code in this editor

var tileWidth = 16;
var tileHeight = 16;
var tileindex2
if tileindex=1 tileindex2=2 else tileindex2=1;

if (global.beat)
{
	// Loop through the tiles in the tilemap
	for (var i = 0; i < room_width / tileWidth; i++)
	{
	    for (var j = 0; j < room_height / tileHeight; j++)
	    {
			
			data=tilemap_get_at_pixel(map_id,i*tileWidth,j*tileHeight)
	       if ((i+j) % 2 == 1 && data!=0)
	       {
				var tileseted=tilemap_set(map_id, tileindex,i,j);
				
	       }
		   if ((i+j) % 2 == 0 && data!=0)
	       {
				var tileseted=tilemap_set(map_id, tileindex2,i,j);
				
	       }
	    }
	}
	if (tileindex==1) tileindex=2 else tileindex=1;
}