/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_self();
if(global.DrawText)
{
	draw_text(x,y+16,string(global.beatprogress));
	draw_text(x,y+32,string(image_index));
}