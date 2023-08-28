 // Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function store_beat_hit(xx,yy,text){

//var xxx = argument[0];
//var yyy = argument[1];
//var texto = argument[2];

var new_text=
	{
		x_pos : xx,
		y_pos : yy,
		texto : text,
		alpha : 1
	}
ds_list_add(beat_hit_data, new_text);
}
function draw_beat_hit_texts()
{

	var num_text = ds_list_size(beat_hit_data);
	if (num_text >0){
		var i;
		for (i = 0; i < num_text; i++) {
		    var current_text = beat_hit_data[|i];
		    var _x = current_text.x_pos;
		    var _y = current_text.y_pos;
		    var _text = current_text.texto;
			var _alpha = current_text.alpha;
			
			var _scribble_object=scribble(_text);
			_scribble_object.starting_format("fnt_RODIN",c_white);
			_scribble_object.blend(c_white,_alpha);
			//tilt the text
			var scaled_x = pi * (_alpha - 0.5);
			var _angle	 = 5 * sin(scaled_x);
			_scribble_object.transform(1,1,_angle);
			
			//draw text
			_scribble_object.draw(_x,_y);
		    
			//draw_text_scribble(_x, _y, _text);
	
			
			beat_hit_data[|i].y_pos -= 2;
		    beat_hit_data[|i].alpha -= 0.025;
		

		    if (beat_hit_data[|i].alpha <= 0) {
		        ds_list_delete(beat_hit_data, i);
		        i--;
		        num_text--;
		    }
		}
	}
}

