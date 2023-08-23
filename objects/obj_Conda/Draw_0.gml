/// @description Insert description here
// You can write your code in this editor
//red flash hit shader
if(start_flash1)
{
	x1+=0.1
    current_flash=max(sin(x1)*flash,0);
	if (current_flash<=0)
	{
		start_flash1=false;
		x1=0;
		current_flash=0;
	}else{
		shader_set(sha_red_flash);
		shader_set_uniform_f(sh_fhlash,current_flash);
	}
}
//white outline shader
if(stance ==EnemyStance.prepare)
{
	shader_set(sha_white_outline);	
	var _texture = sprite_get_texture(sprite_index,image_index);
	var _texture_width = texture_get_texel_width(_texture);
    var _texture_height = texture_get_texel_height(_texture);
	shader_set_uniform_f(sh_texture,_texture_width,_texture_height);
}
//red outline shader
if(stance == EnemyStance.attack)
{
    shader_set(sha_red_outline);	
	var _texture = sprite_get_texture(sprite_index,image_index);
	var _texture_width = texture_get_texel_width(_texture);
    var _texture_height = texture_get_texel_height(_texture);
	shader_set_uniform_f(sh_texture,_texture_width,_texture_height);
}

draw_self();
if(shader_current() != -1) shader_reset();

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
	draw_text(_x-16,_y+128+64+32+16,"point: "+string(map_value(hp,0,hpmax,0,48)));
	draw_text(_x-16,_y+256,"ATAQUE: "+string(ataque));
	draw_text(_x-16,_y+256+16,"hp: "+string(hp));
}

//draw_path(current_path,xstart,ystart,0)
for(var i=0;i<path_get_number(current_path);i++)
{
    var _xTo,_yTo;

	var _control=obj_fight_control;

	//get the coordinates of the point to go
	var _current_path_x = path_get_point_x(current_path,i);
	var _current_path_y = path_get_point_y(current_path,i);
	//scale to screen resolution
	var _fight_room_width = 1024; //width of path's canvas
	var _fight_room_height = 576; //height of path's canvas
	var _point_x=map_value(_current_path_x,0,_fight_room_width,0,global.res.width);
	var _point_y=map_value(_current_path_y,0,_fight_room_height,0,global.res.height);

	_xTo=_control.x+ _point_x;
	_yTo=_control.y+_point_y;
	
	draw_circle(_xTo,_yTo,2,0);
}