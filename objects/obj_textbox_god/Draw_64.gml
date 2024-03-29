/// @description Insert description here
// You can write your code in this editor

var _gui_x			=	gui_x;
var _gui_y			=	gui_y;
var draw_text_x		=	_gui_x;
var draw_text_y		=	_gui_y;
var draw_text_width =	text_width;
var portrait_scale	=	2;
var finished		=	(text_progress == text_length);
var _portrait		=	sprite_exists(portrait_sprite);


switch (textbox_state)
{
	case textbox_states.dibujando_pt:
		if(_portrait)
		{
			var draw_portrait_x = _gui_x;
			var draw_portrait_y = _gui_y;
	
			var _DissolveSprUvs = sprite_get_uvs(portrait_sprite,0);

			shader_set(_Dissolve_Shader);
			shader_set_uniform_f(_u_Dissolve,luma_time);
			shader_set_uniform_f(_u_DissolveEdge,_DissolveEdge);
			shader_set_uniform_f(_u_DissolveUV,_DissolveTexUvs[0],_DissolveTexUvs[1]);
			shader_set_uniform_f(_u_DefaultUV,_DissolveSprUvs[0],_DissolveSprUvs[1]);
			shader_set_uniform_f(_u_DissolveC1,_DissolveC1[0],_DissolveC1[1],_DissolveC1[2]);
			shader_set_uniform_f(_u_DissolveC2,_DissolveC2[0],_DissolveC2[1],_DissolveC2[2]);
			texture_set_stage(_u_DissolveTex,_DissolveTex);
		
			
			draw_sprite_stretched(portrait_sprite,0,draw_portrait_x ,draw_portrait_y,portrait_width,portrait_height);
			
			shader_reset();
		}
		else textbox_state=textbox_states.creciendo_tb;
	break;
    case textbox_states.creciendo_tb:
		//draw growing box
		if(_portrait) draw_text_x+=portrait_width;
		draw_sprite_stretched(sprite_index, 0, draw_text_x, draw_text_y, width*increasing_value, height);
		if(_portrait)
		{
			var draw_portrait_x = _gui_x;
			var draw_portrait_y = _gui_y;
			var draw_portrait_xscale = 1;
				
			//Animate the portrait when typing
			var subimg = 0;
			if(!finished) subimg = (text_progress / text_speed) * (sprite_get_speed(portrait_sprite) / game_get_speed(gamespeed_fps));
			
			var _alpha=map_value(increasing_value,0,1,0,0.3);
			draw_sprite_stretched_ext(spr_portrait_galaxy,paw_index,draw_portrait_x,draw_portrait_y,portrait_width,portrait_height,c_white,_alpha);
			draw_sprite_stretched(portrait_sprite,subimg,draw_portrait_x ,draw_portrait_y,portrait_width,portrait_height);	
		}
	break;
	
	//TEXTO CRECIENDO
	case textbox_states.escribiendo:
		
	//BOX
	
		if(_portrait) draw_text_x+=portrait_width;
		draw_sprite_stretched(sprite_index, image_index, draw_text_x, draw_text_y, width, height);
		
	//Portrait
		if(_portrait)
		{
			var draw_portrait_x = _gui_x;
			var draw_portrait_y = _gui_y;
			var draw_portrait_xscale = 1;
				
			//Animate the portrait when typing
			var subimg = 0;
			if(!finished) subimg = (text_progress / text_speed) * (sprite_get_speed(portrait_sprite) / game_get_speed(gamespeed_fps));
			if(global.beat)paw_index++;
			draw_set_alpha(0.35);
			draw_sprite_stretched(spr_portrait_galaxy,paw_index,draw_portrait_x,draw_portrait_y,portrait_width,portrait_height);
			draw_set_alpha(1);
			draw_sprite_stretched(portrait_sprite,subimg,draw_portrait_x ,draw_portrait_y,portrait_width,portrait_height);	
		}
		
		//TEXT
		
		if(global.DrawText) draw_circle(draw_text_x,draw_text_y,3,false);
		var _frame_width=text_wrap_width;
		var _frame_height=text_wrap_height;
		
		scribble_object.align(fa_left,fa_top);
		scribble_object.starting_format(text_font,text_color);
		scribble_object.wrap(draw_text_width-_frame_width*2);
		scribble_object.draw(draw_text_x+_frame_width,draw_text_y+_frame_height,typist);
		
		//paw
		//if(finished)
		//{
		//	var _paw_x=_gui_x+width-3*padding;
		//	var _paw_y=_gui_y+height-3*padding;

		//	if(global.beat) 
		//	{
		//		if(paw_index==0) paw_index=1 else paw_index=0;
		//	}

		//	draw_sprite(paw_sprite,paw_index,_paw_x,_paw_y);
		//}
		//Options
		if(finished && option_count >0)
		{
			for(var i = 0; i < option_count ; i++)
			{
				var opt_x = x + option_x;
				var opt_y = y + option_y - (option_count - i - 1)*option_spacing;
		
				//Selected option is indented with an arrow
				if( i == current_option)
				{
					var _scale=1;

					opt_x += option_selection_indent;
					draw_sprite_ext(spr_textbox_paw,0,opt_x - 30,opt_y-2,_scale,_scale,0,c_white,1);
				}
				
				
				var _string=options[i].text;
				var _scribble_option=scribble(_string);
				
				var _option_width=max(option_width,_scribble_option.get_width()+padding*2);
				draw_sprite_stretched(sprite_index,1,opt_x,opt_y,_option_width,option_height);
				
				_scribble_option.align(fa_left,fa_middle);
				_scribble_option.starting_format(text_font,option_text_color);
				_scribble_option.draw(opt_x+option_text_x,opt_y+padding+2);
				
			}
		
		}
	
	break;


}
	if(global.DrawText)
	{
	    draw_circle(x,y,2,false);
		draw_circle_color(draw_text_x,draw_text_y,2,c_blue,c_blue,false);
		draw_circle(gui_x,gui_y,3,false);
	}	








