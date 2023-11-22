/// @description Insert description here
// You can write your code in this editor

var _x=200;
var _y=200;

var _dy=30;
if(global.DrawText)
{
	for(var i=10;i<array_length(action_list);i++)
	{
	    draw_text(_x,_y+_dy*(i-10),string(script_get_name(action_list[i][0])));
		draw_text(_x+350,_y+_dy*(i-10),string(action_list[i][1]));
	}
}

