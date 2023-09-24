/// @description Insert description here
// You can write your code in this editor

var _speed= y_speed;

if(global.runny_activate_frenzy)
{
	_speed=y_speed_frenzy;
}
y-=_speed;

if(global.beat)
{
    image_alpha=1;
	rotation_speed=initial_rotation_speed;
	
	
}else
{
	if(global.runny_activate_frenzy)
	{
		image_alpha=1
	}else image_alpha-=vanish;
	image_angle-=rotation_speed;
	rotation_speed-=rotation_speed_decrease;
	
}
if(y<=-20) instance_destroy();


