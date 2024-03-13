/// @description Insert description here
// You can write your code in this editor

var _player,_beat,_ok;
if(instance_exists(o_player))_player=true;
if(instance_exists(obj_beat))_beat=true;
if(_player&&_beat)_ok=true;

var _bar_height=5;
x=o_player.x+15;
y=o_player.y-2;

if(_ok)
{
    var _count=obj_beat.groovy_count;
	var _max=obj_beat.groovy_max;
	for(var i=0;i<_count;i++)
	{
	    draw_sprite(sprite_index,i,x,y-i*_bar_height);
	}
 
}



