/// @description Insert description here
// You can write your code in this editor

var _max_scale=1;
var _scale_speed=0.2;
if(room==rm_GD)
{
	_max_scale=3;
	_scale_speed=_scale_speed*3;
}
sprite_scale=min(sprite_scale+_scale_speed,_max_scale);


if(player!=(-1)) draw_sprite_ext(spell_sprite,0,player.x,player.y,sprite_scale,sprite_scale,0,c_white,1);









