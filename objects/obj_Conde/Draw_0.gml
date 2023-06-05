/// @description Insert description here
// You can write your code in this editor
draw_self();
if (global.DrawText){
	draw_text(x-16,y+16,string(x_to))
	draw_text(x-16,y+32,string(y_to))
	draw_text(x-16,y+32+16,string(global.beatchance));
	draw_text(x-16,y+64,string(state));
	draw_text(x-16,y+64+16,string(Izquierda+Arriba+Abajo))
	draw_text(x-16,y+64+32,string(sprite_get_speed(sprite_index)));
	draw_text(xstart-16,ystart+64+32+16,"hola: "+string(hola));
}