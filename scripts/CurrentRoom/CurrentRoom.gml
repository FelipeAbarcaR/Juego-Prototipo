// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function current(_index){
	var _value = global.room_data[global.currentroom][_index];
	return _value
}

function target(_index){
	
	var _map=global.roomTarget
	var _array=global.room_data;
	var _found = false;
	for(var i=0;i<array_length(_array);i++)
	{
	    if(_map==_array[i][index.name])
		{
		    _found=true;
			break;
		}
	}
	if(_found)
	{
	    var _value = global.room_data[i][_index];
		return _value
	}else
	{
	    return bgm_Kappn;
		show_debug_message("target(): BGM not found, selected bgm_Kappn")
	}
	
	
}