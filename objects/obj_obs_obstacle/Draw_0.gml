/// @description Insert description here
// You can write your code in this editor

draw_self();

//if(obs_type==obstacle.updown)
//{
//	var _sprite_grid=32;
//	var _grid_distance=3;
//	var _up_distance=_sprite_grid*_grid_distance;
//    draw_sprite_ext(spr_fan,image_index,x,y-_up_distance,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
//}

if(global.DrawText)
{
    draw_sprite_bbox();
}