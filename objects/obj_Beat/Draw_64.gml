/// @description Draw BeatBar
// You can write your code in this editor
//var _mode=global.room_data[global.currentroom][index.mode];
//if (_mode!=mode.fight) //print in gui only if is NOT in fight mode, (bc there is no cam)
//{
	var a //scale of the heart in 'beat'
	if global.beatchance{
		a=1.2
	} else a=1

	//reference positions 
	var _wpos,_hpos,_scale;
	_wpos = 0.95;
	_hpos=0.30;
	
	//draw yellow box range
	var _x,_y;
	_x=guiwidth*_wpos;
	_y=guiheight*_hpos

	var _barwidth=40*barscale;
	var _xchance=_x-_barwidth*0.5;
	var _hitheight=BarHalf*barscale*beathitrange; //height of the range of beat's chance
	var _ychance=_y-_hitheight;
	var _beatbarY=_y+BarHalf*BeatBarProgress*barscale

//Beat bar
	draw_sprite_stretched(img_BeatRange,0,_xchance,_ychance,_barwidth,_hitheight*2);
	draw_sprite_ext(img_BeatBar,0,_x,_y,barscale,barscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(img_BeatMeter, 0, _x, _beatbarY,a, a, 0, -1, 1);
	draw_sprite_ext(spr_Heart,0,_x,_y,a*barscale,a*barscale,0,-1,1);
	barX=_x;
	barY=_beatbarY;

//}

if global.DrawText{
	draw_text(2*room_width/3,  32+32, string(BeatBarProgress));
	draw_text(x-20,y,"bpm: "+string(global.bpm));
}


// SHOW BEAT STATUS (PERFECT,GOOD,BAD)

if(keyboard_check_pressed(vk_space))
{
	var _xdist=140;

    if(abs(BeatBarProgress)>=beathitrange) 
	{
	    store_beat_hit(_x-_xdist,_beatbarY,"[c_black]Almost")
	}
	
    if(abs(BeatBarProgress)>=0.30 && abs(BeatBarProgress)<beathitrange) 
	{
	    store_beat_hit(_x-_xdist,_beatbarY,"[c_green]Good!")
	}
	
    if(abs(BeatBarProgress)<0.30) 
	{
	    store_beat_hit(_x-_xdist,_beatbarY,"[wobble][rainbow]Perfect!")
	}

}

draw_beat_hit_texts();