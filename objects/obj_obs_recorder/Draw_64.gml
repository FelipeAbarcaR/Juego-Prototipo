/// @description Insert description here
// You can write your code in this editor
if(global.DrawText&&record)
{
    
	var _theight=32;
	var _tab=32*8;
	var _xx=global.res.guiwidth*(1/3);
	var _yy=global.res.guiheight*(1/3);

	draw_set_color(c_white);
	draw_text(_xx,_yy,"Beat Number");
	draw_text(_xx+_tab,_yy,"Key");

	for (var i = 0; i < array_length(beat_map); i++) {
		//beat number
		draw_text(_xx,_yy+_theight*(i+1),string(beat_map[i][0]));
	
		//beat obstacle
		var _obs=beat_map[i][1];
		var _char
		switch(_obs){
			case obstacle.up:
				_char="arriba";
				break;
			case obstacle.down:
				_char="abajo";
				break;
			case obstacle.updown:
				_char="medio";
				break;	
			case obstacle.activate:
				_char="activar";
				break;					
			default:
			break;
		}		
		draw_text(_xx+_tab,_yy+_theight*(i+1),_char);
	}
}