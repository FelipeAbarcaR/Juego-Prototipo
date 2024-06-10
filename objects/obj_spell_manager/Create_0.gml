/// @description Insert description here
// You can write your code in this editor
global.spell_shield_activated	=	false;
global.spell_3tempo_activated	=	false;
//global.spell_sword_activated	=	false;

spell_shield_called	=	false;
spell_3tempo_called	=	false;
spell_jump_called	=	false;

sprite_yellow_button	=	spr_icons_yellow_button_alpha;
sprite_orange_button	=	spr_icons_green_button_alpha;

spell_icons	=	spr_icons_instruments_TEST;
//26 pandereta
//33 theremin
//38 maracas
spell_sprite_index=[26,33,38,-1]//sprite index of icon spells

spell_shield_cooldown	=	SPELL_SHIELD_COOLDOWN;
spell_3tempo_cooldown	=	SPELL_3TEMPO_COOLDOWN;
spell_jump_cooldown		=	1;	

spell_jump_current_cooldown		=0;
spell_shield_current_cooldown	=0;
spell_3tempo_current_cooldown	=0;

cooldown_dark_sprite=sprite_yellow_button//spr_spell_cooldown;

cd_sprite_uvs=sprite_get_uvs(cooldown_dark_sprite,0);
cd_sprite_uv_center[0]=cd_sprite_uvs[0]+(cd_sprite_uvs[2]-cd_sprite_uvs[0])/2;//horizontal
cd_sprite_uv_center[1]=cd_sprite_uvs[1]+(cd_sprite_uvs[3]-cd_sprite_uvs[1])/2;//vertical
hola=10
spell_icon_slot_position[0]=[0.56,0.11];
spell_icon_slot_position[1]=[0.65,0.1];
spell_icon_slot_position[2]=[0.72,0.14];
spell_icon_slot_position[3]=[0.79,0.1];

shader_cooldown=sha_pie_slice;

push_button_effect= function(_ind)
{
	var _gui_h=display_get_gui_height();
	var _gui_w=display_get_gui_width();
	var _xi = map_value(spell_icon_slot_position[_ind][0],0,1,0,_gui_w);
	var _yi = map_value(spell_icon_slot_position[_ind][1],0,1,0,_gui_h);
	
    var _inst = instance_create_depth(_xi,_yi,depth-1,obj_vanish_gui)
	_inst.sprite_index=spr_icons_instruments_TEST;
	_inst.image_index=spell_sprite_index[_ind];
	_inst.delta_scaling=0.04;
	_inst.vanish=0.05;
}
