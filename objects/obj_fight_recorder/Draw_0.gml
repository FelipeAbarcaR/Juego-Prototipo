/// @description Insert description here
// You can write your code in this editor

if(record)
{
	var _map=fight_map;

	var _spaces=0;
	for (var i = 0; i < array_length(_map); i++) 
	{
		var _x=_map[i][2]+x_start;
		var _y=_map[i][3]+y_start;
	
		var _case =_map[i][1];
	
		switch(_case)
		{
			case move.attack:
				draw_circle_color(_x,_y,3,c_blue,c_blue,false);
			break;
			case move.prepare:
				draw_circle_color(_x,_y,3,c_red,c_red,false);
			break;
			case move.restart:
				_spaces++;
				draw_circle_color(mid_screen_w+4*_spaces,mid_screen_h,3,c_white,c_white,false);
			break;		
		}

	}
}
		








