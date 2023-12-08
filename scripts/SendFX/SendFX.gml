// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SendFX(_sprite,_x,_y,_struct=undefined,_gui=false){
	
	var _spr=_sprite
	var _mystruct=_struct
	if(is_undefined(_struct))
	{	
		var _obj = instance_create_depth(_x,_y,depth-1,obj_effect,{sprite_index : _spr}); 
		_obj.draw_on_gui=_gui;
		return _obj;
	} else
	{
		_mystruct.sprite_index = _spr;
		var _obj = instance_create_depth(_x,_y,depth-1,obj_effect,_mystruct); 
		_obj.draw_on_gui=_gui;
		return _obj;
	}

}
