/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(0.5);
draw_sprite_stretched(spr_getitem_frame,1,x_pos,y_pos,width,height);
draw_set_alpha(1);


var _item_height=height-margin*2;
draw_sprite_stretched(global.itemsprite[ITEM.DASH],0,x_pos+margin,y_pos+margin,_item_height,_item_height);