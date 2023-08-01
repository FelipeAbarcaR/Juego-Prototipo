if(global.textover)
{
	var _npc = "RANA";
	
	switch(global.activate)
	{
		case obj_questie:
			_npc = "VIEJO_SABIO";
			
	}
	
	array_delete(global.dialogue_order[$ _npc],conversation_number,1);
	conversation_number += 1;
	with(obj_questie) // no funciona
	{
		EntityActivateArgs = [global.dialogue_order[$ _npc][0]];
	}
	global.textover = false;
}
// flash ira disminuyendo esta llegar a 0
flash = max(flash - 0.04, 0);