	/// @description Insert description here
// You can write your code in this editor

if(!instance_exists(obj_cutscene) && !instance_exists(obj_background_landscape))
{
	var _bp=global.beatprogress//abs(global.beatprogress-0.5)//(global.beatprogress*2)-1;
	var _initial_scale=0.6;
	var _extra=scr_distribucion_n(_bp,0,0.08,0.007);
	var _scale=_initial_scale+_extra;
	var _gui_h=display_get_gui_height();
	var _gui_w=display_get_gui_width();
	
	for(var i=0;i<4;i++)
	{
		var _xi,_yi,_index;
		var _bg;
		if(i==0)_bg=sprite_orange_button else _bg=sprite_yellow_button;
		
		_xi = map_value(spell_icon_slot_position[i][0],0,1,0,_gui_w);
		_yi = map_value(spell_icon_slot_position[i][1],0,1,0,_gui_h);
	    _index=spell_sprite_index[i];
		
		//draw the background of every spell/item slot
		draw_sprite_ext(_bg,0,_xi,_yi,_scale,_scale,0,c_white,1);
		
		//draw the icon/instrument of that slot(if exists)
		if(_index!=-1)
		{
			draw_sprite_ext(spell_icons,_index,_xi,_yi,_scale,_scale,0,c_white,1);
		}
	}
	

	if(spell_shield_current_cooldown>0)
	{
		
		//r _shadow_scale=1;
		var _cd=spell_shield_current_cooldown/spell_shield_cooldown;
		var _degree_value=map_value(_cd,0,1,360,0);
		var _x1 = map_value(spell_icon_slot_position[1][0],0,1,0,_gui_w);
		var _y1 = map_value(spell_icon_slot_position[1][1],0,1,0,_gui_h);
		
		//draw the shadow of sprite
		//gpu_set_fog(1, c_gray, 0, 1);
		draw_sprite_ext(spell_icons,spell_sprite_index[1],_x1,_y1,_scale,_scale,0,c_gray,1);
		//gpu_set_fog(0, c_gray, 0, 1);
		shader_set(shader_cooldown);
		var _degrees = shader_get_uniform(shader_cooldown,"part_degrees");
		var _uv_center= shader_get_uniform(shader_cooldown,"uv_center");
		//var _value = map_value(device_mouse_y_to_gui(0),0,display_get_gui_height(),0,360);
		shader_set_uniform_f(_degrees,_degree_value);
		//draw_text(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)+5,string(_value))
		shader_set_uniform_f(_uv_center,cd_sprite_uv_center[0],cd_sprite_uv_center[1]);
		draw_sprite_ext(cooldown_dark_sprite,0,_x1,_y1,_scale,_scale,0,c_grey,0.4);
		shader_reset();
	}
	
	if(spell_3tempo_current_cooldown>0)
	{
		
		//r _shadow_scale=1;
		var _cd=spell_3tempo_current_cooldown/spell_3tempo_cooldown;
		var _degree_value=map_value(_cd,0,1,360,0);
		var _x1 = map_value(spell_icon_slot_position[2][0],0,1,0,_gui_w);
		var _y1 = map_value(spell_icon_slot_position[2][1],0,1,0,_gui_h);
		
		//draw the shadow of sprite
		//gpu_set_fog(1, c_gray, 0, 1);
		draw_sprite_ext(spell_icons,spell_sprite_index[2],_x1,_y1,_scale,_scale,0,c_gray,1);
		//gpu_set_fog(0, c_gray, 0, 1);
		shader_set(shader_cooldown);
		var _degrees = shader_get_uniform(shader_cooldown,"part_degrees");
		var _uv_center= shader_get_uniform(shader_cooldown,"uv_center");
		//var _value = map_value(device_mouse_y_to_gui(0),0,display_get_gui_height(),0,360);
		shader_set_uniform_f(_degrees,_degree_value);
		//draw_text(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0)+5,string(_value))
		shader_set_uniform_f(_uv_center,cd_sprite_uv_center[0],cd_sprite_uv_center[1]);
		draw_sprite_ext(cooldown_dark_sprite,0,_x1,_y1,_scale,_scale,0,c_grey,0.4);
		shader_reset();
	}
}




