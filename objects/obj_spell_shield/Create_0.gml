/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_sprite=spr_shield;
spell_cooldown=SPELL_SHIELD_COOLDOWN;
spell_active_time=SPELL_SHIELD_ACTIVE;
active_time=spell_active_time;

sprite_scale=0;
minimize_to_destroy=false;


lay_id=layer_get_id("Instances");
if(layer_exists(lay_id))
{
	depth=layer_get_depth(lay_id)-1;
}