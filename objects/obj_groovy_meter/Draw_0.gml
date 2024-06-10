/// @description Insert description here
// You can write your code in this editor

var _player=false;
var _beat=false;
var _ok;
if(instance_exists(o_player))_player=true;
if(instance_exists(obj_beat))_beat=true;
if(_player&&_beat)_ok=true else _ok=false;

if(_player)
{
	var _bar_height=5;
	x=o_player.x+15;
	y=o_player.y-2;
	image_alpha=min(1,image_alpha+alpha_speed);
	if(_ok)
	{
	    var _count=obj_beat.groovy_count;
		var _max=obj_beat.groovy_max;
		for(var i=0;i<_count;i++)
		{
		    draw_sprite_ext(sprite_index,i,x,y-i*_bar_height,1,1,0,c_white,image_alpha);
		}
 
	}
}


