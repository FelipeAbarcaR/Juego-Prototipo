/// @description Insert description here
// You can write your code in this editor

var _target_x,_target_y;
_target_x	=	point_target[0];
_target_y	=	point_target[1];

var target_point_direction	=	point_direction(x,y,_target_x,_target_y);

var sprite_face_direction	=	target_point_direction+90;

image_angle=sprite_face_direction;

var moving_direction=target_point_direction+90;

var _x_len=lengthdir_x(move_speed,moving_direction);
var _y_len=lengthdir_y(move_speed,moving_direction);

x+=_x_len;
y+=_y_len;

if(attacking)
{
    var _fire=instance_create_depth(x,y,depth-1,obj_runny_dragon_fire);
	_fire.target_x=_target_x;
	_fire.target_y=_target_y;
	attacking=false;
}

