// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SendFX(_sprite,_x,_y,_struct=undefined){
	
	var _spr=_sprite
	var _mystruct=_struct
	if(is_undefined(_struct))
	{
		
		instance_create_depth(_x,_y,-999,obj_effect,{sprite_index : _spr});    
	} else
	{
		_mystruct.sprite_index = _spr;
		instance_create_depth(_x,_y,-999,obj_effect,_mystruct);    
	}

}