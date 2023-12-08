
marker_number=0;
markers=instance_number(obj_guide_markers);

depth=layer_get_depth(layer_get_id("Instances"))-1;

global.guide_marker_id=-1;
global.guide_marker_number=marker_number;
delayed=false;
delay_time=5;

next_marker = function()
{
    marker_number++;
	if(marker_number>=markers)
	{
	    // code here
	}
}
delay= function(_time=undefined)
{
	var __time=delay_time;
	if(_time!=undefined) __time=_time;
	delayed=true;
	alarm[0]=room_speed*__time;
}

var _check_viejo_sabio = function()
{
	if(instance_exists(obj_questie))
	{
		if(global.interact && global.activate==obj_questie.id)
		{
			next_marker();
		}
	}
}

var _check_item_dash = function()
{
	var _item =Inv_hasItem(ITEM.DASH,2);
	if(_item)
	{
		next_marker();
			
	} else delay();
}

var _check_bridge_jump = function()
{
	if(room==roomMapaInicial)
	{
		if(obj_guide_markers.marker_collision!= -1)
		{
			var _id=obj_guide_markers.marker_collision;
			if(_id.guide_marker_number==3) next_marker();
		}
	}
}

var _check_room = function()
{
	if(room!=roomMapaInicial)
	{
	    next_marker();
	}
}

guide_check_functions=
[
	_check_viejo_sabio,
	_check_item_dash,
	_check_bridge_jump,
	_check_room
]

arrows=
[
	spr_arrow_right,
	spr_arrow_up_right,
	spr_arrow_up,
	spr_arrow_up_left,
	spr_arrow_left,
	spr_arrow_down_left,
	spr_arrow_down,
	spr_arrow_down_right
	
]

alarm_time=15;
effect_time=3;
sending_arrow=false;
alarm[2]=room_speed*alarm_time;
effect=-999;