/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

attacking=false;

point_target=[121,32];
point_target2=[240,0]; 

move_speed=1;

distance_traveled=0;

var _point_target;

type_attack=obj_runny_beam;

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

