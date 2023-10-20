/// @description Insert description here
// You can write your code in this editor

var _list = obj_game.inv_list
var _list_size = ds_list_size(_list);
for(var i=0;i<ds_list_size(_list);i++)
{
    var _arr=_list[|i];
	if(_arr[0]==ITEM.BUG)
	{
	    aranitas=arana+_arr[1];
	}
}
