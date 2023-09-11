/// @description Insert description here
// You can write your code in this editor


if (global.DrawText)
{
	if(font_exists(draw_get_font()))
	{
		draw_text(100,100,"font: "+font_get_fontname(draw_get_font()));
	    draw_text(100,100+30,"currentroom: "+room_get_name(room));
	}
}




//var xx = 32;
//var yy = 32;

//for(var i = 0; i <= 1; i++)
//{
//	draw_text(xx,yy,global.topics_names[i]);
//	yy +=32;	
//}



