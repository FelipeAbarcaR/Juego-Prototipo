/// @description dibujar hit y atk

if(draw_background)
{
    draw_sprite_stretched(background,0,x,y,bg_width,bg_height)
}






if(global.DrawText)
{
	draw_text(2*room_width/3, 16, "HIT : "+string(global.enemy_hit));
	draw_text(2*room_width/3,  32, "ATK : "+string(global.enemy_atk));

	with(obj_enemy1)
	{
		draw_text(2*room_width/3, 32+16, "POS : "+string(path_position));
		draw_text(2*room_width/3, 64, "Spd : "+string(path_speed));
		draw_text(2*room_width/3, 64+16, "path : "+(path_get_name(path_index)));
		draw_text(2*room_width/3, 64+32, "stance : "+string(obj_enemy1.stance));
		draw_text(2*room_width/3, 64+48, "stance : "+string(obj_enemy1.bitcount));
	}
}