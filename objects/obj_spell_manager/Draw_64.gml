/// @description Insert description here
// You can write your code in this editor

if(!instance_exists(obj_cutscene) && !instance_exists(obj_background_landscape))
{
	var _scale=1.3;

	var _gui_h=display_get_gui_height();
	var _gui_w=display_get_gui_width();

	var _x1 = map_value(spell_icon_slot_position[0][0],0,1,0,_gui_w);
	var _y1 = map_value(spell_icon_slot_position[0][1],0,1,0,_gui_h);

	draw_sprite_ext(spell_icons,sprite_index_shield,_x1,_y1,_scale,_scale,image_angle,c_white,1);

	if(spell_shield_current_cooldown>0)
	{
		var _cd=spell_shield_current_cooldown/spell_shield_cooldown;
		var _degree_value=map_value(_cd,0,1,360,0);
	
		shader_set(shader_cooldown);
		var _degrees = shader_get_uniform(shader_cooldown,"part_degrees");
		var _uv_center= shader_get_uniform(shader_cooldown,"uv_center");
		//var _value = map_value(device_mouse_y_to_gui(0),0,display_get_gui_height(),0,360);
		shader_set_uniform_f(_degrees,_degree_value);
		shader_set_uniform_f(_uv_center,cd_sprite_uv_center[0],cd_sprite_uv_center[1]);
		draw_sprite_ext(cooldown_dark_sprite,0,_x1,_y1,_scale,_scale,image_angle,c_white,1);
		shader_reset();
	}
}




