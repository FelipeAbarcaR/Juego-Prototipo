// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_activate_region(){
	
	var _middle	 =	bbox_top+(bbox_bottom-bbox_top)/2;
	
	var _detect_distance = 14;
	var _activateX = x + lengthdir_x(_detect_distance, dir);
			
	var _activateY = _middle + lengthdir_y(_detect_distance, dir);
			
	var _activatesize = 4;
			
	draw_rectangle(
		_activateX - _activatesize,
		_activateY - _activatesize,
		_activateX + _activatesize,
		_activateY + _activatesize,
		false
	);
}