enum ITEM {
	
	APPLE,
	ORANGE,
	WOOD,
	DASH,
	BUG
}

global.itemsprite[ITEM.APPLE] = spr_apple;
global.itemsprite[ITEM.ORANGE] = spr_orange;
global.itemsprite[ITEM.WOOD] = spr_wood;
global.itemsprite[ITEM.DASH] = spr_icon_dash;
global.itemsprite[ITEM.BUG] = spr_bug;

global.itemname[ITEM.APPLE]		=	"Manzanita";
global.itemname[ITEM.ORANGE]	= 	"Naranja";
global.itemname[ITEM.WOOD]		= 	"Madera";
global.itemname[ITEM.DASH]		= 	"Dash";
global.itemname[ITEM.BUG]		=	"Bichota";



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
			Inv_Interface(_item,_count);
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
	
	//check for items that are spells and added to the spell list if this is true
	update_spells();
	
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
				Inv_Interface(_item,_count);
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

function Inv_hasItem(_item,_qty=undefined)
{
	
    var _list = obj_game.inv_list;
    var _list_size = ds_list_size(_list);
	var __qty=0;
	if(_qty!=undefined)__qty=_qty;
    for (var i = 0; i < _list_size; i++)
    {
        // Get array
        var _arr = _list[| i];

        // Check item
        if (_arr[0] == _item)
        {
			if(_arr[1] >=__qty)	return true; // Item found in inventory
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