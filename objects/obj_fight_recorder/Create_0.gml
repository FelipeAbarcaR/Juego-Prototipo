/// @description Insert description here
// You can write your code in this editor

fight_map=[];
filename="fightmap.txt"
record=false;

move =
{
	restart: 0,
	prepare: 1,
	attack: 2
}

mid_screen_w=uc_get_view_x()+uc_get_view_width()/2;
mid_screen_h=uc_get_view_y()+uc_get_view_height()/2

depth=obj_fight_control.depth-50;

x_start=uc_get_view_x();
y_start=uc_get_view_y();