/// @description Insert description here
// You can write your code in this editor
if(global.guide_marker_id!=-1 && room=roomMapaInicial)
{
	var _dir =point_direction(o_player.x,o_player.y,global.guide_marker_id.x,global.guide_marker_id.y);
	var _index=round(map_value(_dir,0,359,0,7));
    with(o_player)
	{
		draw_sprite(spr_shadow_arrows,_index,x,y+1); //Shadow
	}
	
	if(sending_arrow)
	{
		var _x_center= display_get_gui_width()/2;
		var _y_center=display_get_gui_height()/2;
		var _len=140;
		var _x_len=lengthdir_x(_len,_dir);
		var _y_len=lengthdir_y(_len,_dir);
		var _x=_x_center+_x_len;
		var _y=_y_center+_y_len;
		var _sprite = arrows[_index];
		var _exist=instance_exists(effect);
		
	    if(!instance_exists(effect)) 
		{
			effect=SendFX(_sprite,_x,_y,undefined,true);
		}
	}
}









