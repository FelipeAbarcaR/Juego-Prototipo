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
	draw_text(_x,_y+_spacing*9	,"Ctrl+Shift:    Ajustar volumen según posición del mouse (más abajo es más volumen");
}