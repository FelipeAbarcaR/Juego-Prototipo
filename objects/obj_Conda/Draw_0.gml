/// @description Insert description here
// You can write your code in this editor
draw_self();

//draw hp bar
	//frame
draw_sprite_ext(
	spr_hpbar2frame,
	0,
	x,
	bbox_top-16,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha);
	
	//health
	
draw_sprite_ext(
	spr_hpbar2hp,
	0,
	bbox_left-25,
	bbox_top-16,
	map_value(hp,0,maxhp,0,45*2), //el 45 no tengo idea, pero calza
	image_yscale,
	image_angle,
	image_blend,
	image_alpha);	
if (global.DrawText){
	var _x,_y,_xTo,_yTo;
	_xTo=path_get_point_x(current_path,point_to_go);
	_yTo=path_get_point_y(current_path,point_to_go);	
	_x=xstart+128;
	_y=ystart-256;
	
	var _currentpathname=path_get_name(current_path)
	draw_text(x-16,y+32+16,string(bitcount));
	draw_text(x-16,y+64,string(stance));
	draw_text(_x-16,_y+64+32,"path: "+string(_currentpathname));
	draw_text(_x-16,_y+64+32+16,"x: "+string(x));
	draw_text(_x-16,_y+128,"y: "+string(y));
	draw_text(_x-16,_y+128+16,"xi: "+string(xi));
	draw_text(_x-16,_y+128+32,"yi: "+string(yi));
	draw_text(_x-16,_y+128+32+16,"xto: "+string(_xTo));
	draw_text(_x-16,_y+128+64,"yto: "+string(_yTo));
	draw_set_color(c_black);
	draw_text(_x-16,_y+128+64+16,"stance: "+string(stance));
	draw_text(_x-16,_y+128+64+32,"point: "+string(point_to_go));
	draw_text(_x-16,_y+128+64+32+16,"point: "+string(map_value(hp,0,maxhp,0,48)));
	draw_text(_x-16,_y+256,"hola: "+string(hola));
	draw_text(_x-16,_y+256+16,"hp: "+string(hp));
}