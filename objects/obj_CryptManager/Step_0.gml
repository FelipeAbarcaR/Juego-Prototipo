/// @description TileManager
// You can write your code in this editor

// check odd tiles and change tilemap

var tileWidth = 16;
var tileHeight = 16;
var tileindex2
if tileindex=1 tileindex2=2 else tileindex2=1;

if (global.beat && danceactive)
{
	if(map_id!=(-1))
	{
		// Loop through the tiles in the tilemap
		for (var i = 0; i < room_width / tileWidth; i++)
		{
		    for (var j = 0; j < room_height / tileHeight; j++)
		    {
			
				var _data=tilemap_get_at_pixel(map_id,i*tileWidth,j*tileHeight)
		       if ((i+j) % 2 == 1 && _data!=0)
		       {
					if(_data!=3) var tileseted=tilemap_set(map_id, tileindex,i,j);
				
		       }
			   if ((i+j) % 2 == 0 && _data!=0)
		       {
					if(_data!=3) var tileseted=tilemap_set(map_id, tileindex2,i,j);
				
		       }
		    }
		}
		if (tileindex==1) tileindex=2 else tileindex=1;
	}
}

var _hand=instance_exists(obj_CountHand);

if(_hand) hand_created=true;

if(hand_created)
{
    if(hand_signal)
	{
	    var _cryptroom=global.cryptroom;
		var _list =_cryptroom.trap_list;
		var _num = _cryptroom.trap_num;
		if _num > 0
		{
		    for (var i = 0; i < _num; ++i;)
		    {
				var _trap=_list[| i]
		        _trap.trap_activated=true;
		    }
		}
		ds_list_destroy(_list);
		hand_create=false;
		hand_signal=false;
	}
}

