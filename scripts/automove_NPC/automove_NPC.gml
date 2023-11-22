// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function automove_entity(_x,_y,_rel,_spd){
	if(x_dest == -1)
		{
			if(!_relative)
			{
				x_dest = _x;
				y_dest = _y;
			}
			else
			{
				x_dest = x + _x;
				y_dest = y + _y;
			}
		}
	
		var _xx = x_dest;
		var _yy = y_dest;
	
		
		if(point_distance(x,y,_xx,_yy) >= _spd)
		{
			var dir = point_direction(x,y,_xx,_yy);
			var ldirx = lengthdir_x(_spd,dir);
			var ldiry = lengthdir_y(_spd,dir);
			
			x+= ldirx;
			y+= ldiry;
		}
		else
		{
			x = _xx;
			y = _yy;
			

			x_dest = -1;
			y_dest = -1;
			automoving=false;
		
			if(global.cutscene) obj_cutscene.next(id);
		}			
}