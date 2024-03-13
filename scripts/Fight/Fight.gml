// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fight_choose_random_attack()
{
	return irandom(array_length(moves)-1);

}

function fight_move_to_point(_x,_y)
{
    var _beat = global.beatprogress;
	var _curve=max(1.2*(_beat*_beat)-0.2,0);
	
	var _x2=_x+corner_x;
	var _y2=_y+corner_y;
	
	var _dir=point_direction(x_from,y_from,_x2,_y2);
	var _len=point_distance(x_from,y_from,_x2,_y2);
	
	var _new_x=x_from+lengthdir_x(_len*_curve,_dir);
	var _new_y=y_from+lengthdir_y(_len*_curve,_dir);
	
	x= _new_x;
	y=_new_y;
	
	return _beat;
}

function fight_count_moves(_type)
{
    var _array=moves;
	if(current_move!=-1)
	{
		var _count=0;
		for (var i=0;i<array_length(_array[current_move]);i++)
		{
		    if(_array[current_move][i][1]==_type) _count++;
		}
		return _count;
	}
	else return 0;
	
}

function fight_attack_to_point(_x,_y)
{
    var _beat = global.beatprogress;
	var _curve=max(1.2*(_beat*_beat)-0.2,0);
	var _x2=_x+corner_x;
	var _y2=_y+corner_y;
	
	var _dir=point_direction(x_from,y_from,_x2,_y2);
	var _len=point_distance(x_from,y_from,_x2,_y2);
	
	var _new_x=x_from+lengthdir_x(_len*_curve,_dir);
	var _new_y=y_from+lengthdir_y(_len*_curve,_dir);
	
	x= _new_x;
	y=_new_y;
	
	return _beat;
}

function fight_set_attack_path(_move_index)
{
    var _move=moves[_move_index]
	var _path = path_add();
	path_set_closed(_path,false);
	path_add_point(_path,x,y,1);
	for(var i=0;i<array_length(_move);i++)
	{
		if(_move[i][1]==2)
		{
			var _x=_move[i][2]+corner_x+x_atk_offset;
			var _y=_move[i][3]+corner_y;
			path_add_point(_path,_x,_y,1);
		}
	}
	
	return _path;
}

