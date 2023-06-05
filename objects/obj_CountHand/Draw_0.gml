/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,image_index,x,y,0.25,0.25,image_angle,image_blend,image_alpha);
if global.DrawText{
	draw_text(x+32,y+32,string(ic));
	draw_text(x+32,y+32+16,string(obj_beat.SumDelta/obj_beat.BeatTimeMS));
	draw_text(x+32,y+64,string(image_index));
}
