event_inherited();

var _list = obj_game.inv_list;
var _arr = _list[| slotID];

//Draw item
if(is_array(_arr))
{
	var _item = _arr[0];
	var _spr = global.itemsprite[_item]; // debria ir un array global de los sprite global.itemsprite
	
	draw_sprite(_spr, 0, x + button_witdh/2, y + button_height/2);
	
	//Draw count
	var _count = _arr[1];
	
	draw_set_font(fnt_UI);
	draw_text(x + 2, y + 4, _count);
	draw_set_font(fnt_text);
}


