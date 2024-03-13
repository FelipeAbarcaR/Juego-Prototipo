/// @description Insert description here
// You can write your code in this editor

var _gui_x			=	map_value(x,view_x,view_x+view_width,0,gui_width);
var _gui_y			=	map_value(y,view_y,view_y+view_height,0,gui_height);
var draw_text_x		=	_gui_x;
var draw_text_y		=	_gui_y;
var draw_text_width =	text_width;
var portrait_scale	=	2;
var finished		=	(text_progress == text_length);


//Portrait
switch (textbox_state)
{
    case textbox_states.creciendo:
		//draw growing box
		
		draw_sprite_stretched(sprite_index, 2, draw_text_x, draw_text_y,width*increasing_value, height*increasing_value);
	break;
	
	case textbox_states.escribiendo:
		
	//BOX
		draw_sprite_stretched(sprite_index, 2, draw_text_x, draw_text_y, width, height);
		
		
	
	//Portrait
		if(sprite_exists(portrait_sprite))
		{
		
			//Shrink text width vy the width the portrait will take up
			draw_text_width -= (portrait_width + portrait_x + padding);
	
			var draw_portrait_x = _gui_x + portrait_x;
			var draw_portrait_y = _gui_y + height/4;
			var draw_portrait_xscale = 1;
	
			//What side is the portrait on?
			if(portrait_side == PORTRAIT_SIDE.LEFT)
			{
				//Shift the text over when the portrait is on the left
				draw_text_x += portrait_width + portrait_x + padding;
			}
			else 
			{
				//Shift the portrait itself over when it is on the right
				draw_portrait_x = _gui_x + width - portrait_width - portrait_x;
				draw_portrait_xscale = -1;
			}
	
			//materialize portrait shader
			
			luma_time=min(luma_time+luma_time_speed,0.99);
			
			if(luma_time<0.99)
			{
				var _DissolveSprUvs = sprite_get_uvs(spr_pt_deer_128,0);

				shader_set(_Dissolve_Shader);
				shader_set_uniform_f(_u_Dissolve,luma_time);
				shader_set_uniform_f(_u_DissolveEdge,_DissolveEdge);
				shader_set_uniform_f(_u_DissolveUV,_DissolveTexUvs[0],_DissolveTexUvs[1]);
				shader_set_uniform_f(_u_DefaultUV,_DissolveSprUvs[0],_DissolveSprUvs[1]);
				shader_set_uniform_f(_u_DissolveC1,_DissolveC1[0],_DissolveC1[1],_DissolveC1[2]);
				shader_set_uniform_f(_u_DissolveC2,_DissolveC2[0],_DissolveC2[1],_DissolveC2[2]);
				texture_set_stage(_u_DissolveTex,_DissolveTex);
			}
			//Animate the portrait when typing
			var subimg = 0;
			if(!finished) subimg = (text_progress / text_speed) * (sprite_get_speed(portrait_sprite) / game_get_speed(gamespeed_fps));
			
			draw_sprite_stretched(portrait_sprite,subimg,draw_portrait_x ,draw_portrait_y,portrait_width,portrait_height);
			
			shader_reset();

		}
	
			//Speaker
		
			if(speaker_name != "")
			{
				//Expand the nameplate if the name is wider than the default width
			
				var _scribble_speaker=scribble(speaker_name);
				var name_w = max(_scribble_speaker.get_width()+padding*2, speaker_width);
				var name_h= max(_scribble_speaker.get_height()+padding*2,speaker_height);
				//el padding los puse como extra para que calce, en verdad no se pq pero funciona
				//draw_sprite_stretched(spr_name,0,x + speaker_x-name_w/2, y + speaker_y-speaker_height/2, name_w+padding*2, speaker_height+padding*2);
			
				_scribble_speaker.starting_format(speaker_font,#5c2e17);
				_scribble_speaker.draw(draw_text_x+text_x,draw_text_y+text_y+padding);
				//_scribble_speaker.starting_format(text_font,speaker_color);
				//_scribble_speaker.draw(draw_text_x+text_x+2,draw_text_y+text_y+2);
			
				//adjust the text position under the speaker name
				draw_text_y+=name_h;
			}

			// TEXT
			//change te position and format of the text depending on the lenght of the text
			//switch between the top left corner of the textbox to the middle center
			//if(text_length>=lenght_shift_format)
			//{
				scribble_object.align(fa_left,fa_top);
			//}
			//else
			//{
			//    scribble_object.align(fa_center,fa_middle);
			//	draw_text_x=floor(draw_text_x + (draw_text_width/2));
			//	draw_text_y=floor(draw_text_y+text_y)
			//}
		
			scribble_object.starting_format(text_font,text_color);
			scribble_object.wrap(draw_text_width);
			scribble_object.draw(draw_text_x,draw_text_y,typist);
			if(finished)
			{
			    var _paw_x=_gui_x+width-3*padding;
				var _paw_y=_gui_y+height-3*padding;

				if(global.beat) 
				{
				    if(paw_index==0) paw_index=1 else paw_index=0;
				}

				draw_sprite(paw_sprite,paw_index,_paw_x,_paw_y);
			}
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
		draw_circle_color(draw_text_x,draw_text_y,2,c_blue,c_blue,false)
	}	








