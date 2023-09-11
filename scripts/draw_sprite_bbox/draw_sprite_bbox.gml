// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_sprite_bbox(){
	var _x1,_x2,_x3,_x4;
	var _y1,_y2,_y3,_y4;
	_x1 = bbox_left;
	_x2 = bbox_right;
	_x3 = bbox_left;
	_x4 = bbox_right;
	
	_y1 = bbox_top;
	_y2 = bbox_top;
	_y3 = bbox_bottom;
	_y4 = bbox_bottom;
	
    draw_line(_x1,_y1,_x2,_y2);
	draw_line(_x1,_y1,_x3,_y3);
	draw_line(_x3,_y3,_x4,_y4);
	draw_line(_x2,_y2,_x4,_y4);
}

