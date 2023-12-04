
// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(global.DrawText)
{
	var _point_target;

	if(x>=uc_get_view_width()/2)
	{
	    _point_target=point_target;
	}
	else
	{
	    _point_target=point_target2;
	}

	var _target_x,_target_y;
	_target_x	=	_point_target[0];
	_target_y	=	_point_target[1];

	draw_circle_color(_target_x,_target_y,4,c_maroon,c_maroon,false);

	draw_line(x,y,_target_x,_target_y);

	draw_text(x+lengthdir_x(point_distance(x,y,_target_x,_target_y)/2,point_direction(x,y,_target_x,_target_y)),y+lengthdir_y(point_distance(x,y,_target_x,_target_y)/2,point_direction(x,y,_target_x,_target_y)),string(point_distance(x,y,_target_x,_target_y)))
}