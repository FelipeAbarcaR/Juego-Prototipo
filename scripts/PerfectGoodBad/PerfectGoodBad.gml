// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function store_beat_hit(xx,yy,text){

	var new_text = ds_map_create();
	ds_map_add(new_text, "x", xx);
	ds_map_add(new_text, "y", yy);
	ds_map_add(new_text, "text", text);
	ds_map_add(new_text, "alpha", 1);
	ds_list_add(beat_hit_data, new_text);
	ds_map_destroy(new_text);

}

function draw_beat_hit_texts()
{
	var num_text = ds_list_size(beat_hit_data);
	var i;
	for ( i = 0; i < num_text; i++) {
		
	    var current_text = ds_map_create();
		ds_map_copy(current_text,beat_hit_data[|i]);
	    var _x = current_text[? "x"];
	    var _y = current_text[? "y"];
	    var _text = current_text[? "text"];

	    //draw_set_alpha(current_text[? "alpha"]);
		
	    draw_text(_x, _y, _text);

	    current_text[? "y"] -= 2;
	    current_text[? "alpha"] -= 0.025;

	    if (current_text[? "alpha"] <= 0) {
	        ds_list_delete(beat_hit_data, i);
	        i--;
	        num_text--;
			ds_map_destroy(current_text);
	    }
	}
}
