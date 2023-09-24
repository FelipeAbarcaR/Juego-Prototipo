/// @description Insert description here
// You can write your code in this editor

var _speed= y_speed;

if(global.runny_activate_frenzy && frenzy_available)
{
	_speed=y_speed_frenzy;
	image_xscale+=frenzy_scale_image_speed;
	image_yscale+=frenzy_scale_image_speed;
	
	if(image_xscale>=4) instance_destroy();
}
y-=_speed;

if(global.beat)
{
    image_alpha=1;
	rotation_speed=initial_rotation_speed;
	  y_speed=initial_y_speed;

	
}else
{
	if(global.runny_activate_frenzy && frenzy_available)
	{
		image_alpha=1
	}else image_alpha-=vanish;
	image_angle-=rotation_speed;
	rotation_speed-=rotation_speed_decrease;
	y_speed=clamp(y_speed-speed_decrease,0.5,initial_y_speed) ;
	
}
if(y<=-40) instance_destroy();

