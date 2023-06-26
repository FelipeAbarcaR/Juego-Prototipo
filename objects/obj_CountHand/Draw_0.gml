/// @description Insert description here
// You can write your code in this editor

//draw in room (not gui) if x and y position is setted
if(game_mode==mode.fight)	
{
	var _x,_y;
	_x=room_width*0.65;
	_y=room_height*0.15;
	draw_sprite_ext(sprite_index,image_index,_x,_y,0.5,0.5,image_angle,image_blend,image_alpha);
}else{
	if(x+y != 0)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,0.5,0.5,image_angle,image_blend,image_alpha);

		if global.DrawText
		{
			draw_text(x+32,y+32,string(ic));
			draw_text(x+32,y+32+16,string(obj_beat.SumDelta/global.BeatTimeMS));
			draw_text(x+32,y+64,string(image_index));
		}
	}
}