/// @description Insert description here
// You can write your code in this editor

if(spell_shield_called)
{
    if(!instance_exists(obj_spell_shield))
	{
	    var _spell = instance_create_depth(x,y,depth-1,obj_spell_shield);
		spell_shield_current_cooldown=spell_shield_cooldown;
	}
	else
	{
	    show_debug_message("obj_spell_manager: Ya hay un obj_shield en jogo");
	}
	
	spell_shield_called=false;
}


if(global.beat)
{
	if(spell_shield_current_cooldown>0) spell_shield_current_cooldown--;
}