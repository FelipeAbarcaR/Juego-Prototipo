/// @description Insert description here
// You can write your code in this editor
gui_width=display_get_gui_width();
gui_height=display_get_gui_height();

image_alpha=0.8;

x_pos= 50;
y_pos=gui_height*(3/5);

move_speed=1.6;
alpha_speed=0.01;

margin=8;

width=208;
height=48;

if(variable_instance_exists(id,"item_id"))
{
	if(item_id!=-1)
	{
	    item_sprite=global.itemsprite[item_id];
		item_name=global.itemname[item_id];
	}
}else
{
    show_debug_message("obj_getitem_frame no se encontró ITEM.ID (-1 o no fue asignado)");
	item_id=-1;
}
