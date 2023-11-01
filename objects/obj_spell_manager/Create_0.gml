/// @description Insert description here
// You can write your code in this editor
global.spell_shield_activated	=	false;
//global.spell_3tempo_activated	=	false;
//global.spell_sword_activated	=	false;

spell_shield_called=false;

spell_icons=spr_icons_TEST;
sprite_index_shield=64;

spell_shield_cooldown=SPELL_SHIELD_COOLDOWN;
spell_shield_current_cooldown=0;

cooldown_dark_sprite=spr_spell_cooldown;

cd_sprite_uvs=sprite_get_uvs(cooldown_dark_sprite,0);
cd_sprite_uv_center[0]=cd_sprite_uvs[0]+(cd_sprite_uvs[2]-cd_sprite_uvs[0])/2;
cd_sprite_uv_center[1]=cd_sprite_uvs[1]+(cd_sprite_uvs[3]-cd_sprite_uvs[1])/2;

spell_icon_slot_position[0]=[1-0.80,0.9];

shader_cooldown=sha_pie_slice;
