/// @description Insert description here
// You can write your code in this editor

if (global.DrawText)
{

	var _x=96;
	var _y=96;
	var _dy=16;
	draw_text(_x,_y			,"currentroom: "+room_get_name(room));
	draw_text(_x,_y+_dy*4	,"Game time: "+ string(game_time/1000000));
	draw_text(_x,_y+_dy*5	,"Room time: "+ string(room_time/1000000));
	
	if(font_exists(draw_get_font()))
	{
		draw_text(_x,_y+_dy*2,"font: "+font_get_fontname(draw_get_font()));
	    
	}
}



//Mouse cursor
draw_circle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),3,false);


if(pause)
{
    var _x=global.res.guiwidth*(1/5);
	var _y=global.res.guiheight*(1/5);
	var _spacing=16;
	draw_text(_x,_y+_spacing*0	,"HOTKEYS");
	draw_text(_x,_y+_spacing*1	,"M:      Change Map");
	draw_text(_x,_y+_spacing*2	,"R:      Restart Game");
	draw_text(_x,_y+_spacing*3	,"T:      Restart Room");
	draw_text(_x,_y+_spacing*4	,"Shift:  Show Parameters");
	draw_text(_x,_y+_spacing*5	,"F:      'Fix' Beat");
	draw_text(_x,_y+_spacing*6	,"Ctrl+F: Cambiar velocidad del Beat");
	draw_text(_x,_y+_spacing*7	,"H:      Start Hand");
	draw_text(_x,_y+_spacing*9	,"Ctrl+Shift+(cursor position):    Ajustar volumen según posición del mouse (más abajo es más volumen");
}

if(game_over)
{
	_sep=10; //separation of pixels between characters
    _x=global.res.guiwidth/2-string_length("RESTART")-_sep*5;
	_y=global.res.guiheight/2
	draw_text_ext_transformed(_x,_y,"RESTART",_sep,300,2,2,0);
}