// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bridge_set_landing(_distance_roll){
	//create new point of landing closer to the edge of the bridge
	//depending on wich side you are jumping
						
						var _distanceroll=_distance_roll;
						
						var _xto,_yto;
						_xto	=	x	+	lengthdir_x(_distanceroll, dir);
						_yto	=	y	+	lengthdir_y(_distanceroll, dir);
					
						var _bridge	=	o_solid_bridge;	
						
						var _solid	=	instance_place(_xto,_yto,_bridge)
						
						var _x1		=	_solid.bbox_left;
						var _x2		=	_solid.bbox_right;
						
						var _y_center	=	_solid.bbox_top+floor((_solid.bbox_bottom-_solid.bbox_top)/2);
						var _xmid		=	_x1+(_x2-_x1)/2;						
						var _bridge_width	=	_solid.sprite_width;
						var _izq	=	(dir>90 && dir<270);
						var _newx;
						
						//left
						if (_izq)
						{
						    if (_xto <= _xmid && _distanceroll>=_bridge_width)
							{
							    _newx=_x1-8;
							}
							else _newx=_x2+8;
						} else //right
						{
						    if (_xto >= _xmid && _distanceroll>=_bridge_width)
							{
							    _newx=_x2+8;
							}
							else _newx=_x2+8;
						}
						

						var _newdirection = point_direction(x,y,_newx,_y_center);
						dir=_newdirection;
						_distanceroll=point_distance(x,y,_newx,_y_center);
						
						return _distanceroll;

}