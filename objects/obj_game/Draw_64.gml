/// @description Insert description here
// You can write your code in this editor


if (global.DrawText)
{
	if(font_exists(draw_get_font()))
	{
		draw_text(100,100,"font: "+font_get_fontname(draw_get_font()));
	    draw_text(100,100+30,"currentroom: "+room_get_name(room));
	}else draw_text(100,100+30,"currentroom: "+room_get_name(room));
}