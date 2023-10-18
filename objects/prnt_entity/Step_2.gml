if(global.textover)
{
	if(self.id == global.activate)
	{
		var _npc = object_get_name(object_index);
		var _array = global.dialogue_order[$ _npc];
		
		if(is_array(_array) and _array != [])
		{
			//array_delete(_array,0,1);
			var _ready = false;
				
			for(var i =0; i < array_length(_array); i++)
			{
				var _topico_temp = _array[i];
					
				if(_topico_temp != -1)
				{
					array_set(_array,i,-1);
						
					if( i+1 < array_length(_array)) 
					{
						var _topico = _array[i+1];
						
						global.activate.EntityActivateArgs = [_topico];
						global.textover = false;	
						_ready = true;	
						break;
					}
					else
					{
						global.activate.EntityActivateScript = -1;
						global.activate.EntityActivateArgs = [-1];
						global.textover = false;
					}
				}
			}
				
			if(!_ready) 
			{
				global.activate.EntityActivateScript = -1;
				global.activate.EntityActivateArgs = [-1];
				global.textover = false;
			}
				
			//if(global.dialogue_loop[$ _topico] == 1)
			//{
			//	array_insert(_array,array_length(_array),_topico);
			//}
		}
	}
}
// flash ira disminuyendo esta llegar a 0
flash = max(flash - 0.04, 0);
