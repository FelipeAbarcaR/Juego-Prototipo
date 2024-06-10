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
	push_button_effect(1);
}

if(spell_3tempo_called)
{
    if(!instance_exists(obj_spell_3tempo))
	{
	    var _spell = instance_create_depth(x,y,depth-1,obj_spell_3tempo);
		spell_3tempo_current_cooldown=spell_3tempo_cooldown;
	}
	else
	{
	    show_debug_message("obj_spell_manager: Ya hay un obj_spell_3tempo en jogo");
	}
	
	spell_3tempo_called=false;
	push_button_effect(2);
}
if(spell_jump_called)
{
    if(!instance_exists(obj_spell_jump))
	{
	    var _spell = instance_create_depth(x,y,depth-1,obj_spell_jump);
		spell_jump_current_cooldown=spell_jump_cooldown;
	}
	else
	{
	    show_debug_message("obj_spell_manager: Ya hay un obj_spell_jump en jogo");
	}
	
	spell_jump_called=false;
	push_button_effect(0);
}


if(global.beat)
{
	if(spell_shield_current_cooldown>0)
	{
		spell_shield_current_cooldown--;
	}
	
	if(spell_3tempo_current_cooldown>0)
	{
		spell_3tempo_current_cooldown--;
	}
	
	if(spell_jump_current_cooldown>0)
	{
		spell_jump_current_cooldown--;
	}
}