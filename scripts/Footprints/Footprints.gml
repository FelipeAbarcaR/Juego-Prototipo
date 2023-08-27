// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function check_floor_tiles(){
	//Check for a collision with 'footprintable' tilemap, if it is, then create alpha object manager
	if(layer_exists(layer_get_id("terrain_base")))
	{
		var _lay_id=layer_get_id("terrain_base");
		var _tilemap_id=layer_tilemap_get_id(_lay_id);
		var _alpha_tile_collision = tilemap_get_at_pixel(_tilemap_id,x,y);
		show_debug_message("tilemap: "+string(_alpha_tile_collision));
		if (_alpha_tile_collision==611) //sand tile map = 611
		{
				var _istooclose=false;
				var _paw=0;
				if(instance_exists(obj_footprint))
				{
					var _last_footprint=instance_nearest(x,y,obj_footprint);
					if (_last_footprint.paw==0) _paw=1;
					var _distance=16+8;
				    if(point_distance(x,y,_last_footprint.x,_last_footprint.y)<=_distance)
					{
					   _istooclose=true;
					} else _istooclose=false; 
				}
				
				var _footprintcount=instance_number(obj_footprint)
			   if(_footprintcount<=10 && !_istooclose)
			   {
			       var _x,_y;
				   _x=x;
				   _y=y;
				   
				   var _footprint=instance_create_depth(_x,_y,depth,obj_footprint,{paw	:	_paw});
				   with(_footprint)
				   {
					   sprite_color=#9ea04f;
					   vanish=0.01;
				       sprite_index=spr_footprint;
					   image_angle=o_player.dir-90;
				   }
			   }
		}
	}
}