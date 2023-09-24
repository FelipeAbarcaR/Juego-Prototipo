/// @description Draw BeatBar
// You can write your code in this editor
//var _mode=global.room_data[global.currentroom][Index.mode];
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
	draw_sprite_ext(img_BeatBarFrame,0,_x,_y,barscale,barscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(img_BeatMeter, 0, _x, _beatbarY,a, a, 0, -1, 1);
	if(global.beat)
	{
	   var _obj=instance_create_depth(_x,_beatbarY,depth,obj_vanish);
	   _obj.draw_on_gui=true;
	}
	draw_sprite_ext(spr_Heart,0,_x,_y,a*barscale,a*barscale,0,-1,1);
	barX=_x;
	barY=_beatbarY;



if global.DrawText{

	var _width=global.res.guiwidth;
	var _spacing=16;
	
	draw_text(3*_width/4,  _spacing*4	,			"BeatBarProgress: "+ string(BeatBarProgress));
	draw_text(3*_width/4,  _spacing*5	,		"Global Progress: "+ string(global.beatprogress));
	draw_text(3*_width/4,  _spacing*6	,		"BPM, Beat: "+ string(global.bpm)+", "+string(global.BeatNumber));
	draw_text(3*_width/4,  _spacing*7	,			"BeatTimeMS "+ string(global.BeatTimeMS/1000));
	draw_text(3*_width/4,  _spacing*8	,		"BGM: "+ string(audio_get_name(current_music)));
	draw_text(3*_width/4,  _spacing*9	,		"beat_fix: "+ string(beat_fix));
	draw_text(3*_width/4,  _spacing*10	,	"beatrange: "+ string(beathitrange));
	draw_text(3*_width/4,  _spacing*11	,		"beat_speed: "+ string(beat_speed));	
	draw_text(3*_width/4,  _spacing*12	,	"Volume: "+string(audio_sound_get_gain(bgm_snd)));	
	
}



 //SHOW BEAT STATUS (PERFECT,GOOD,BAD)
var _player_input=0;
if(instance_exists(obj_crypt_player))
{
    if (obj_crypt_player.key_direction_pressed) _player_input=true;
}
if(keyboard_check_pressed(vk_space) || _player_input)
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



////DRAW BAR 2
//var _scale=1.8;
//if(global.beatprogress>=0.5)
//{
//	_scale=2;
//	//instance_create_depth()
//}
//draw_sprite_stretched(spr_beat_frame_2,(get_timer()*(4/1000000)),bar2_x-(beat_frame_width/2),bar2_y-beat_frame_height,beat_frame_width,beat_frame_height);
//draw_sprite_ext(spr_beat_heart_2,0,bar2_x,bar2_y,_scale,_scale,0,c_white,1);
//draw_sprite_stretched(img_BeatRange,0,bar2_x-(beat_frame_width/2),bar2_y-bar2_range,beat_frame_width,bar2_range*2);
//var _length=array_length(beat_meter_list);

//if(_length>0)
//{
//	for(var i=0;i<_length;i++)
//	{
//		var _yy=beat_meter_list[i];
//	    draw_sprite_ext(spr_beat_meter_2,0,bar2_x,_yy,1.7,1.7,0,c_white,1-max(0,min(1,(_yy-bar2_y)/bar2_range)));
//	}
//}
