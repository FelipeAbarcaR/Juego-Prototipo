//Draw nothing
var _width = global.res.width*(5/8) - (margin*2/3);
var _height = global.res.height/5+18;
var _x = (global.res.width- _width)/2;
var _y = global.res.height - _height - margin*(1/3);
if (!already_fighting)
{
	draw_blurry_background(_x,_y,_width,_height,#919191);
}