/// @description Insert description here
// You can write your code in this editor
draw_self();

if global.DrawText{
	draw_text(x,y+16,string(inputmagnitude));
	draw_text(x,y+32,string(Posicion));
	draw_text(x,y+32+16,string(image_index));
}