
//room control

	global.currentroom=0;
	global.previousroom=global.currentroom;
	
	//Room data rooms index in Macros (enum) 
	//room_data=[room_name, Music, BPM, obj_to_follow, room_mode, mainChar, zoom, witdh, height]
	global.room_data = [

		[roomMapaInicial,			bgm_ForestTime,			126,	o_player,			mode.move,		o_player,			CMODE.OBJECT_BORDERS],
		[rm_GD,						bgm_boss_01,			127,	obj_obs_player,		mode.obstacle,	obj_obs_player,		CMODE.OBJECT_FOLLOWING],
		[roomMapa1Dungeon,			bgm_NightCall_118,		118,	o_player,			mode.move,		o_player,			CMODE.OBJECT_BORDERS],
		[rm_runny,					/*bgm_Boss1_190BPM*/bgm_midnight_100,		100,		o_player,			mode.move,		o_player,	CMODE.OBJECT_FOLLOWING],
		[roomMapa2,					bgm_illbethere,			95,		o_player,			mode.move,		o_player,			CMODE.OBJECT_BORDERS],
		//[rm_runny,					bgm_midnight_100,		100,	o_player,			mode.move,		o_player,			false,	0,	0],
		[roomMapa1,					bgm_WillPower_89,		89 ,	o_player,			mode.move,		o_player,			CMODE.OBJECT_BORDERS],
		[roomViejoSabio,			bgm_ForestTimeInterior, 126,	o_player,			mode.move,		o_player,			CMODE.OBJECT_FOLLOWING],
		[roomMapa1NPC,				bgm_WillPower_89,		89,		o_player,			mode.move,		o_player,			CMODE.OBJECT_FOLLOWING],
		[roomMapa1Casapalchuto,		bgm_WillPower_89,		89,		o_player,			mode.move,		o_player,			CMODE.OBJECT_FOLLOWING],
		
	];
	
	global.room_count=array_length(global.room_data);
	
	enum rm
	{
		inicial,
		fight,
		obstaculos,
		viejosabio,
	}
	

function room_get_bgm(_room=undefined)
{
	var _r=_room;
	if (_room==undefined) _r=current(Index.name);
    var arrayLength = global.room_count;
	var _data=global.room_data;

	for (var i = 0; i < arrayLength; i++) {
	    if (_data[i, 0] == _r) {
	        return _data[i, 1];
	    }
    }
	show_debug_message("room_get_bgm(): no se encontró BGM, entregando bgm_Kappn");
	return _data[0,1]
}

function room_get_mode(_room=undefined)
{
	var _r=_room;
	if (_room==undefined) _r=room_get_current_room_index();
    var arrayLength = global.room_count;
	var _data=global.room_data;

	for (var i = 0; i < arrayLength; i++) {
	    if (i == _r) {
			var _mode=Index.mode;
	        return _data[i, _mode];
	    }
    }
	show_debug_message("room_get_mode(): no se encontró room para ");
	return _data[0,1]
}

//GET THE CURRENT 'SOMETHING' FROM CURRENT ROOM
function current(_index){
	//check if currentroom is good
	_data=global.room_data;
	var _current_room = _data[global.currentroom][Index.name];
	var _value;
	if(_current_room==room)
	{
	   _value = _data[global.currentroom][_index];
	}else
	{
	    global.currentroom=room_get_current_room_index();
		_value = _data[global.currentroom][_index];
	}
	
	return _value
}
//GET THE CURRENT 'SOMETHING' FROM TARGET ROOM
function target(_index){
	
	var _map=global.roomTarget
	var _array=global.room_data;
	var _found = false;
	for(var i=0;i<array_length(_array);i++)
	{
	    if(_map==_array[i][Index.name])
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
function room_get_current_room_index()
{
    var _room=room;
	var _data=global.room_data;
	var _count=global.room_count;
	
	for(var i=0;i<_count;i++)
	{
	    if(_data[i][0]==_room)
		{
			return i;
		}
	}
	show_debug_message("get_current_room(), no se encontró el mapa, devolviendo 0 (M0)");
	return 0;
}