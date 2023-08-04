if(global.textover)
{
	//if(global.activate != noone) _npc = "RANA";
	var _obj = object_get_name(global.activate);
	
	if(is_array(global.dialogue_order[$ _obj]))
	{
		array_delete(global.dialogue_order[$ _obj],0,1);
		global.activate.EntityActivateArgs = [global.dialogue_order[$ _obj][0]];
	}
	
	global.textover = false;
}
// flash ira disminuyendo esta llegar a 0
flash = max(flash - 0.04, 0);
