/// @description Insert description here
// You can write your code in this editor

direction=point_direction(x,y,target_x,target_y);
image_angle=direction;

// Inherit the parent event
event_inherited();

var _x_len=lengthdir_x(move_speed,direction);
var _y_len=lengthdir_y(move_speed,direction);

x+=_x_len;
y+=_y_len;

//if(x<=0 || y<=0) instance_destroy();

var _dist = point_distance(x,y,target_x,target_y);
if (_dist<=move_speed) instance_destroy();