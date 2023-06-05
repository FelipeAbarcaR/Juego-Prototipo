/// @description HP Bar
// Puede escribir su código en este editor
var _scale=0.6 //scale temporals hasta ajustar screen
draw_sprite_ext(spr_hpbardbg,0,hpbar_x,hpbar_y,_scale,_scale,image_angle,image_blend,image_alpha);
draw_sprite_stretched(spr_hpbar1,0,hpbar_x,hpbar_y,(hp/hpmax)*hpbar_width*_scale,hpbar_height*_scale);
draw_sprite_ext(spr_hpbarb,0,hpbar_x,hpbar_y,_scale,_scale,image_angle,image_blend,image_alpha);