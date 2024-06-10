// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_spells(){
	
	//with(obj_spell_manager)
	//{
	//    var _list = obj_game.inv_list;
		
	//	if(
	//}

}
function spell_call_jump()
{
	if(obj_spell_manager.spell_jump_current_cooldown<=0)
	{
		obj_spell_manager.spell_jump_called=true;
	}
	else
	{
	   show_debug_message("spell_call_jump(): jump is on cooldown dude");
	}
    
}

function spell_call_shield()
{
	if(obj_spell_manager.spell_shield_current_cooldown<=0)
	{
		obj_spell_manager.spell_shield_called=true;
	}
	else
	{
	   show_debug_message("spell_call_shield(): Shield is on cooldown dude");
	}
    
}

function spell_call_3tempo()
{
    if(obj_spell_manager.spell_3tempo_current_cooldown<=0)
	{
		obj_spell_manager.spell_3tempo_called=true;
	}
	else
	{
	   show_debug_message("spell_call_3tempo(): 3tempo is on cooldown dude");
	}
	
}