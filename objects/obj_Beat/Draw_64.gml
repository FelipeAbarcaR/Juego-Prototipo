/// @description Insert description here
// You can write your code in this editor

/// @description Draw BeatBar
// You can write your code in this editor

	//reference positions 
	//check first of is not on cutscene or showing landscape ARREGLAR
if(!instance_exists(obj_cutscene) && !instance_exists(obj_background_landscape))
{
	var _x,_y;
	_x=bar2_x;
	_y=bar2_y;


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
		draw_text(3*_width/4,  _spacing*11	,		"beats_per_input: "+ string(beats_per_input));	
		draw_text(3*_width/4,  _spacing*12	,	"Volume: "+string(audio_sound_get_gain(bgm_snd)));	
	}


	 if(beat_bar_visible)
	 {
		//BEAT BAR 2
		var _scale=3;

		//if(global.beatprogress>=0.75)
		//{
		//	_scale=_scale*1.15 //latido: aumentar el sprite en 15% cerca del ritmo;

		//}
	
		//frame
		var _animation_speed;
		if(global.groovy)
		{
			_animation_speed=(get_timer()/1000000)*4;	
		} else _animation_speed=0;
		var __scale=4;
	
		//draw_sprite_stretched(spr_beat_frame_2,_animation_speed,_x-(beat_frame_width/2),bar2_y-beat_frame_height,beat_frame_width,beat_frame_height);
		draw_sprite_ext(spr_beat_frame_4,_animation_speed,_x-(beat_frame_width/2),bar2_y-beat_frame_height,__scale,__scale,0,c_white,1);
		//"heart", base de la barra
	
		//draw_sprite_ext(spr_beat_heart_2,0,_x,bar2_y,_scale,_scale,0,c_white,1);
		var _rotation;

		if(heart_pulse)
		{
			var _amplitude		=	shake_amplitude;
			var _increase		=	0.1;
			var _shake_length	=	5;
			var _frequency		=	2;
		
			beat_heart_t += _increase;

			var _t	=	beat_heart_t;
		
			_rotation= sin(_t*pi*_frequency)*(1-_t/_shake_length)*_amplitude;
		
			if(_t==_shake_length)
			{
				heart_pulse=false;
				beat_heart_t=0;
			}
		} else _rotation=0;

		draw_sprite_ext(spr_beat_heart_4,0,_x+_rotation,bar2_y,_scale,_scale,_rotation,c_white,1);
	
		//beat range
		if(global.DrawText)
		{
			draw_set_alpha(0.25);
			var _h=beat_frame_height;
			var _w=beat_frame_width;
			draw_rectangle_color(_x-_w/2,_y-_h*beathitrange,_x+_w/2,_y+_h*beathitrange,c_orange,c_orange,#e0bf1b,#e0bf1b,false);
			draw_rectangle_color(_x-_w/2,_y-_h*beathitrange/2,_x+_w/2,_y+_h*beathitrange/2,c_green,c_green,c_green,c_green,false);
			draw_set_alpha(1);
		}
	
		//"beats", cositas que caen
		var _length=array_length(beat_meter_list);

		if(_length>0) //si hay al menos 1 beat en la queue
		{
			for(var i=0;i<_length;i++)
			{
				var _bar_scale=2;
				var _yy=beat_meter_list[i];
				var _paw_index=0;
				if(i==0 && frozen_beat) _paw_index=1;
			    draw_sprite_ext(spr_beat_meter_4,_paw_index,_x,_yy,_bar_scale,_bar_scale,0,c_white,1-max(0,min(1,(_yy-bar2_y)/bar2_range)));
			}

		}

		var _index=clamp(groovy_count,0,groovy_max);
		var _dx=30;
		var _dy=16;
		draw_sprite(spr_numbers,_index,_x+_dx,_y)
		draw_beat_hit_texts();	

		if(global.beatchance)draw_circle_color(_x+_dx,_y+_dy*2,5,c_orange,c_blue,false);
	 }
}