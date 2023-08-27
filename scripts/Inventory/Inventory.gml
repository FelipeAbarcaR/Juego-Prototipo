enum ITEM {
	
	APPLE,
	ORANGE,
	WOOD,
	DASH
}

global.itemsprite[ITEM.APPLE] = spr_apple;
global.itemsprite[ITEM.ORANGE] = spr_orange;
global.itemsprite[ITEM.WOOD] = spr_wood;
global.itemsprite[ITEM.DASH] = spr_icon_dash;

global.itemname[ITEM.APPLE]		=	"Manzanita";
global.itemname[ITEM.ORANGE]	= 	"Naranja";
global.itemname[ITEM.WOOD]		= 	"Madera";
global.itemname[ITEM.DASH]		= 	"Dash";



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
	Inv_Interface(_item,_count);
	
	return true;

}

function Inv_del(_item,_count){
    var _list = obj_game.inv_list;
    var _list_size = ds_list_size(_list);

    for (var i = 0; i < _list_size; i++)
    {
        // Get array
        var _arr = _list[| i];

        // Check item
        if (_arr[0] == _item)
        {
            // Check if enough quantity is available to remove
            if (_arr[1] >= _count)
            {
                _arr[@ 1] -= _count;
                return true;
            }
            else
            {
                // Not enough quantity to remove, so remove the entire stack
                ds_list_delete(_list, i);
                return true;
				Inv_Interface(_item,_count);
            }
        }
    }
    // Item not found in inventory
    return false;

}

function Inv_hasItem(_item)
{
    var _list = obj_game.inv_list;
    var _list_size = ds_list_size(_list);

    for (var i = 0; i < _list_size; i++)
    {
        // Get array
        var _arr = _list[| i];

        // Check item
        if (_arr[0] == _item)
        {
            return true; // Item found in inventory
        }
    }
    
    return false; // Item not found in inventory
}

function Inv_Interface(_item,_qty)
{
    var _obj = instance_create_depth(x,y,depth,obj_getitem_GUI,
		{
		    item_id	:	_item,
			item_quantity	:	_qty	
		});
}