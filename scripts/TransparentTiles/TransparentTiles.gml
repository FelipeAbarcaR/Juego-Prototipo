// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_alpha_tiles(){
	//Check for a collision with alpha layer tilemap, if it is, then create alpha object manager
	var _lay_id=layer_get_id("Alpha");
	if(_lay_id!=-1)
	{
		var _tilemap_id=layer_tilemap_get_id(_lay_id);
		var _alpha_tile_collision = tilemap_get_at_pixel(_tilemap_id,x,y);
		if (_alpha_tile_collision)
		{
		    if(!instance_exists(obj_alphaontile))
			{
				//create the object in the corner of the space of where to apply alpha
				var _tileswidth = 4;
				var _tilesheight= 4;
				var _x=x-(x%16)-16*(_tileswidth/2); // 16 is the width of tiles in pixels
				var _y=y-y%16-16*(_tilesheight/2); // one tile up from the player
			
			
				instance_create_depth(_x,_y,depth-1,obj_alphaontile);
			}
		}
	}

}