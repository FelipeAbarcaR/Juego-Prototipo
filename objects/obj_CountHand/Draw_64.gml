/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

//draw in room

var _scale=0.75;
draw_sprite_ext(sprite_index,image_index,gui_x,gui_y,_scale,_scale,image_angle,image_blend,image_alpha);

if global.DrawText
{
	draw_text(x+32,y+32,string(ic));
	draw_text(x+32,y+32+16,string(obj_beat.SumDelta/global.BeatTimeMS));
	draw_text(x+32,y+64,string(image_index));
}






