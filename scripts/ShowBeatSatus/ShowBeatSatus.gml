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
			var _previousalpha=draw_get_alpha();
		    draw_set_alpha(current_text.alpha);

			draw_text_scribble(_x, _y, _text);

		    beat_hit_data[|i].y_pos -= 2;
		    beat_hit_data[|i].alpha -= 0.025;
		
			draw_set_alpha(_previousalpha);		

		    if (beat_hit_data[|i].alpha <= 0) {
		        ds_list_delete(beat_hit_data, i);
		        i--;
		        num_text--;
		    }
		}
	}
}

