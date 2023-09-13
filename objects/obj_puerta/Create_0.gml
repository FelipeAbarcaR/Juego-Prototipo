/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();

image_index = 0;
image_speed = 0;

if(RoomName != noone)
{
	var _room_index = asset_get_index(RoomName);
	
	var _data = global.room_data;
	var _count = global.room_count;
	var _found =0;
	for(var i=0;i<_count;i++)
	{
	    var _room=_data[i][Index.name];
		if(_room==_room_index)
		{
		    EntityActivateArgs=[i,RoomTargetX,RoomTargetY];
			break;
		}
	}
	if (!_found) show_debug_message("obj_puerta no encontró el room de RoomName");
}


