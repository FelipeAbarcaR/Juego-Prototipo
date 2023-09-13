image_index = 0;
image_speed = 0;

flipimageyscale=-1;

room_target=-1;

if(RoomName != "-1")
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
		    room_target=_room;
			break;
			_found=1;
		}
	}
	if (!_found) show_debug_message("obj_room_exit no encontró el room de RoomName " +RoomName);
}