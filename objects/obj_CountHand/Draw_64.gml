/// @description Insert description here
// You can write your code in this editor
var _x,_y,_scale,_guiwidth,_guiheight;
_scale=0.25;
if (game_mode!=mode.fight)
{
	if(x+y==0)
	{
		//premade gui's position in case is not setted
	

		var _mode=global.room_data[global.currentroom][index.mode];
		if(_mode==mode.fight)
		{
			_guiwidth=room_width;
			_guiheight=room_height;
		}else 
		{
			_guiwidth=guiwidth;
			_guiheight=guiheight;
		}
	
	_x=_guiwidth*0.65;
	_y=_guiheight*0.15;	

	draw_sprite_ext(sprite_index,image_index,_x,_y,_scale,_scale,image_angle,image_blend,image_alpha);

	if global.DrawText
	{
		draw_text(_x+32,_y+32,string(ic));
		draw_text(_x+32,_y+32+16,string(obj_beat.SumDelta/obj_beat.BeatTimeMS));
		draw_text(_x+32,_y+64,string(image_index));
	}
	}
}