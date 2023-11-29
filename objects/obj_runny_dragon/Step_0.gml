/// @description Insert description here
// You can write your code in this editor

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

var target_point_direction	=	point_direction(x,y,_target_x,_target_y);
var sprite_face_direction	=	target_point_direction+90;

image_angle	=	sprite_face_direction;

var moving_direction	=	target_point_direction+90;

var _x_len	=	lengthdir_x(move_speed,moving_direction);
var _y_len	=	lengthdir_y(move_speed,moving_direction);

if(!instance_exists(obj_runny_beam))
{
	x+=_x_len;
	y+=_y_len;

	//var _uc_right=uc_get_view_x()+uc_get_view_width()
	var _uc_left=uc_get_view_x();
	var _uc_top=uc_get_view_y();
	var _uc_bottom=uc_get_view_y()+uc_get_view_height();
	
	x=clamp(x,_uc_left,xstart);
	y=min(y,_uc_bottom-40);
	
	distance_traveled+=move_speed;
	
	image_xscale=1-distance_traveled*0.0006;
	image_yscale=1-distance_traveled*0.0006;
	
	if(y<_uc_top-30) instance_destroy()
	
}



if(attacking)
{
	attacking=false;
	show_debug_message("dragon attacanding")
	var _beam=instance_create_depth(x,y,depth-1,type_attack);
	_beam.target_x=_target_x;
	_beam.target_y=_target_y;
}


