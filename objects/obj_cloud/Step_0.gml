/// @description Insert description here
// You can write your code in this editor

x+=self.speed;

if(x>=room_width) x=0;

var _obj=o_player;

if(instance_exists(_obj))
{
	var _x1,_x2,_y1,_y2,_r;
	_r=16;
	_x1	=	bbox_left	-	_r;
	_x2	=	bbox_right	+	_r;
	_y1	=	bbox_top	-	_r;
	_y2	=	bbox_bottom	+	_r;
	
	var _col=collision_rectangle(_x1,_y1,_x2,_y2,_obj,false,1);
	
	if(_col!=noone) //_obj.x,_obj.y,id
	{
		image_alpha=max(image_alpha-0.04,maxalpha)
	}else
	{
		image_alpha=min(image_alpha+0.04,1.00)
	}
}