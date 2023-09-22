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

//}
//// circle frame
//	draw_sprite_ext(spr_circle_frame,0,_x-300,_y,4,4,image_angle,image_blend,image_alpha);
//	draw_sprite_ext(spr_circle_meter, 0, _x-300, _y,4, 4, global.beatprogress*360, c_white, 1);

if global.DrawText{

	var _width=global.res.guiwidth;
	var _gain=audio_sound_get_gain(current_music);
	
	draw_text(3*_width/4,  64,			"BeatBarProgress: "+ string(BeatBarProgress));
	draw_text(3*_width/4,  64+16,		"Global Progress: "+ string(global.beatprogress));
	draw_text(3*_width/4,  32+64,		"BPM, Beat: "+ string(global.bpm)+", "+string(global.BeatNumber));
	draw_text(3*_width/4,  128,			"BeatTimeMS "+ string(global.BeatTimeMS/1000));
	draw_text(3*_width/4,  128+16,		"BGM: "+ string(audio_get_name(current_music)));
	draw_text(3*_width/4,  128+32,		"beat_fix: "+ string(beat_fix));
	draw_text(3*_width/4,  128+32+16,	"beatrange: "+ string(beathitrange));
	draw_text(3*_width/4,  128+64,		"beat_speed: "+ string(beat_speed));	
	draw_text(3*_width/4,  128+64+16,	"Volume: "+ string(_gain)+" bgm_snd:"+string(audio_sound_get_gain(bgm_snd)));	
	draw_text(3*_width/4,  128+64+32,	"Audio is playing?current: "+ string(audio_is_playing(current_music)));	
	draw_text(3*_width/4,  128+64+32+16,	"Audio is playing?new: "+ string(audio_is_playing(new_music)));
	draw_text(3*_width/4,  128+128,	"Audio is playing?bgm_snd: "+ string(audio_is_playing(bgm_snd)));
}



 //SHOW BEAT STATUS (PERFECT,GOOD,BAD)

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