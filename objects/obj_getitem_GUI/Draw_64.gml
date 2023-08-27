/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(image_alpha);
draw_sprite_stretched(spr_getitem_frame,1,x_pos,y_pos,width,height);

var _sprite_height=height-margin*2;
if(item_id!=-1)
{
	if(item_name!=-1)
	{
		draw_sprite_stretched(item_sprite,0,x_pos+margin,y_pos+margin,_sprite_height,_sprite_height);
	}
	var _qty="";
	if(item_quantity!=-1)
	{
	    _qty=string(item_quantity)+" ";
	}
    draw_text(x_pos+margin+_sprite_height+margin,y_pos,_qty+item_name);
	
}


draw_set_alpha(1);