/// @description Insert description here
// You can write your code in this editor
if (room=rm_pelea)
{
	if(background != -1)
	{
	
		var lay_id = layer_get_id("Background");
		var back_id = layer_background_get_id(lay_id);
		layer_background_sprite(back_id, background);
		var back_id = layer_background_get_id(lay_id);
		var _spriteid =layer_background_get_sprite(back_id);
		show_debug_message(sprite_get_name(_spriteid))
	
		//if(enemy != -1)
		//{
		//	PONER PARA CAMBIAR ENEMIGO EN ALGUN MOMENTO
		//}
	}
}