/// @description Draw BeatBar
// You can write your code in this editor

var a //scale
if global.beatchance{
	a=1.2
} else a=1

var _barscale=0.6;

//draw yellow box range
var rangescale=(BarHalf*beathitrange)/(boxchancelenght*0.5)
draw_sprite_ext(img_BeatRange,0,x,y,_barscale,rangescale*_barscale,0,-1,1);


draw_sprite_ext(img_BeatBar,0,x,y,_barscale,_barscale,image_angle,image_blend,image_alpha)
draw_sprite_ext(img_BeatMeter, 0, x, y+BarHalf*BeatBarProgress*_barscale,a, a, 0, -1, 1);
draw_sprite_ext(spr_Heart,0,x,y,a*_barscale,a*_barscale,0,-1,1)

if global.DrawText{
	draw_text(2*room_width/3,  32+32, string(BeatBarProgress));
	draw_text(x-16,y,string(bpm));
}
