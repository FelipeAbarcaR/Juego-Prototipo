/// @description Draw BeatBar
// You can write your code in this editor
//var _mode=global.room_data[global.currentroom][Index.mode];
//if (_mode!=mode.fight) //print in gui only if is NOT in fight mode, (bc there is no cam)
//{
//	var a //scale of the heart in 'beat'
//	if global.beatchance{
//		a=1.2
//	} else a=1

//	//reference positions 
	//var _wpos,_hpos,_scale;
	//_wpos = 0.95;
	//_hpos=0.30;
	
	//draw yellow box range
	var _x,_y;
	_x=bar2_x;
	_y=bar2_y;

//	var _barwidth=40*barscale;
//	var _xchance=_x-_barwidth*0.5;
//	var _hitheight=BarHalf*barscale*beathitrange; //height of the range of beat's chance
//	var _ychance=_y-_hitheight;
	//var _beatbarY=_y+BarHalf*BeatBarProgress*barscale

////Beat bar
//	draw_sprite_stretched(img_BeatRange,0,_xchance,_ychance,_barwidth,_hitheight*2);
//	draw_sprite_ext(img_BeatBarFrame,0,_x,_y,barscale,barscale,image_angle,image_blend,image_alpha);
//	draw_sprite_ext(img_BeatMeter, 0, _x, _beatbarY,a, a, 0, -1, 1);
//	if(global.beat)
//	{
//	   var _obj=instance_create_depth(_x,_beatbarY,depth,obj_vanish);
//	   _obj.draw_on_gui=true;
//	}
//	draw_sprite_ext(spr_Heart,0,_x,_y,a*barscale,a*barscale,0,-1,1);
//	barX=_x;
//	barY=_beatbarY;



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



 
//BEAT BAR 2
var _scale=2;

if(global.beatprogress>=0.75)
{
	_scale=2*1.15 //latido: aumentar el sprite en 15% cerca del ritmo;

}
//frame
var _animation_speed=(get_timer()/1000000)*4;
draw_sprite_stretched(spr_beat_frame_2,_animation_speed,_x-(beat_frame_width/2),bar2_y-beat_frame_height,beat_frame_width,beat_frame_height);
//"heart", base de la barra
draw_sprite_ext(spr_beat_heart_2,0,_x,bar2_y,_scale,_scale,0,c_white,1);
//beat yellow range
draw_sprite_stretched(img_BeatRange,0,_x-(beat_frame_width/2),bar2_y-bar2_range,beat_frame_width,bar2_range*2);

//"beats", cositas que caen
var _length=array_length(beat_meter_list);

if(_length>0) //si hay al menos 1 beat en la queue
{
	for(var i=0;i<_length;i++)
	{
		var _bar_scale=3
		var _yy=beat_meter_list[i];
	    draw_sprite_ext(spr_beat_meter_2,0,_x,_yy,_bar_scale,_bar_scale,0,c_white,1-max(0,min(1,(_yy-bar2_y)/bar2_range)));
	}

}

var _index=clamp(groovy_count,0,groovy_max);
var _dx=30;
var _dy=16;
draw_sprite(spr_numbers,_index,_x+_dx,_y)
draw_rectangle(_x-_dx,_y,_x+_dx,_y+_dy,false);
draw_beat_hit_texts();	

if(global.beatchance)draw_circle_color(_x+_dx,_y+_dy*2,5,c_orange,c_blue,false);





