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
	
	var _new_x=x+lengthdir_x(_len*_curve,_dir);
	var _new_y=y+lengthdir_y(_len*_curve,_dir);
	
	x= _new_x;
	y=_new_y;
	
	return _beat;
}

