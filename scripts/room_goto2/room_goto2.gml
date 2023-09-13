// for now it only change current room and go to room name
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function room_goto2(_roomindex)
{
	
	//global.currentroom=_roomindex;
	var _name=Index.name;
	var _roomname=global.room_data[_roomindex][_name];
	room_goto(_roomname);

}