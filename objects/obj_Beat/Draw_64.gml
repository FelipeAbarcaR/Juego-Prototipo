/// @description Draw BeatBar
// You can write your code in this editor

var a //scale
if global.beatchance{
	a=1.2
} else a=1

//reference positions 
var _wpos,_hpos;
_wpos = 0.95;
_hpos=0.30;

var _barscale=0.6;

//draw yellow box range
var _x,_y;
_x=guiwidth*_wpos;
_y=guiheight*_hpos

var _barwidth=40*_barscale;
var _xchance=_x-_barwidth*0.5;
var _hitheight=BarHalf*_barscale*beathitrange; //height of the range of beat's chance
var _ychance=_y-_hitheight;
var _beatbarY=_y+BarHalf*BeatBarProgress*_barscale

draw_sprite_stretched(img_BeatRange,0,_xchance,_ychance,_barwidth,_hitheight*2);
draw_sprite_ext(img_BeatBar,0,_x,_y,_barscale,_barscale,image_angle,image_blend,image_alpha);
draw_sprite_ext(img_BeatMeter, 0, _x, _beatbarY,a, a, 0, -1, 1);
draw_sprite_ext(spr_Heart,0,_x,_y,a*_barscale,a*_barscale,0,-1,1);
barX=_x;
barY=_beatbarY;


if global.DrawText{
	draw_text(2*room_width/3,  32+32, string(BeatBarProgress));
	draw_text(x-16,y,string(bpm));
}
