/// @description npc follow

var _npc = object_get_name(object_index);
if(global.npc_follow[$ _npc])
{
	x = o_player.pos_x[10];
	y = o_player.pos_y[10];
	
}


if(id == global.activate && EntitySpaceBarActive) 
{
	if(player_active_range)
	{
		if(EntityActivateScript == startDialogue)
		{
			instance_activate_object(space_bar);
		}
		player_active_range=false;
	}else instance_deactivate_object(space_bar)
}
