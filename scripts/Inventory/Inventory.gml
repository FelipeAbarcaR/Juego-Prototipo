enum ITEM {
	
	APPLE,
	ORANGE,
	WOOD
}

global.itemsprite[ITEM.APPLE] = spr_apple;
global.itemsprite[ITEM.ORANGE] = spr_orange;
global.itemsprite[ITEM.WOOD] = spr_wood;

//Inventory
#macro INV_SIZE 12



function Inv_add(_item,_count)
{
	var _list = obj_game.inv_list;
	
	var _list_size = ds_list_size(_list);
	
	for(var i = 0; i < _list_size; i++)
	{
		//Get array
		var _arr = _list[| i];
		
		//Check item
		if(_arr[0] == _item)
		{
			_arr[@ 1] += _count;
			return true;
		}
	}
	//Inventory is full
	if(_list_size >= INV_SIZE)
	{
		return false;
	}
	//Create new array
	var _arr = [_item, _count];
	
	ds_list_add(_list,_arr);
	
	return true;

}