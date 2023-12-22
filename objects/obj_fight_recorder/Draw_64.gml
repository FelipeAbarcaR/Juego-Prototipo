/// @description Insert description here
// You can write your code in this editor
if(global.DrawText&&record)
{
    
	var _theight=32;
	var _tab=32*8;
	var _xx=global.res.guiwidth*(1/3);
	var _yy=global.res.guiheight*(1/4);

	draw_set_color(c_white);
	draw_text(_xx,_yy,"Beat Number");
	draw_text(_xx+_tab,_yy,"Key");
	
	var _map=fight_map;
	for (var i = 0; i < array_length(_map); i++) {
		
		//beat number
		draw_text(_xx,_yy+_theight*(i+1),string(_map[i][0]));
	
		//beat obstacle
		var _obs=_map[i][1];
		var _x_string=string(_map[i][2]);
		var _y_string=string(_map[i][3]);
		var _char
		switch(_obs){
			case move.attack:
				_char="ataque";
				break;
			case move.prepare:
				_char="prepare";
				break;
			case move.restart:
				_char="restart";
				break;
			default:
			break;
		}
		
		draw_text(_xx+_tab,_yy+_theight*(i+1),_char);
		draw_text(_xx+_tab*2,_yy+_theight*(i+1),"x: "+_x_string+" y: "+_y_string);
	}
}







