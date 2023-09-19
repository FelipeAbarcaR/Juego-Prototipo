/// @description Insert description here
// You can write your code in this editor


if (global.DrawText)
{
	if(font_exists(draw_get_font()))
	{
		draw_text(100,100,"font: "+font_get_fontname(draw_get_font()));
	    
	}
	draw_text(96,96+16,"currentroom: "+room_get_name(room));
	draw_text(96,96+32,"Zoom Width: "+ string(global.zoom_width));
	draw_text(96,96+32+16,"Zoom Height: "+ string(global.zoom_height));
	draw_text(96,96+64,"Zoom Percentage: "+ string(global.percentage_zoom)+"%");
}