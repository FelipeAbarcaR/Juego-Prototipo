if(global.textover)
{
	if(id == global.activate)
	{
		var _npc = object_get_name(object_index);
		var _array = global.dialogue_order[$ _npc];
		
		if(is_array(_array) and _array != [])
		{
			var _topico = _array[0];
			
			if(global.dialogue_loop[$ _topico] == 1)
			{
				array_insert(_array,array_length(_array),_topico);
			}
			array_delete(_array,0,1);
			
			if(_array != []) 
			{
				global.activate.EntityActivateArgs = [_topico];
				global.textover = false;
			}
			else //_array == []
			{
				global.activate.EntityActivateScript = -1;
				global.activate.EntityActivateArgs = -1;
			}
			
		}
	}
}
// flash ira disminuyendo esta llegar a 0
flash = max(flash - 0.04, 0);
