/// @description Insert description here
// You can write your code in this editor
if(table_cat)
{
	var _index=1;
	if(dir>=90 && dir<=270) _index=0;
	draw_sprite(spr_runny_table,_index,x,y);
}

// Inherit the parent event
event_inherited();

