
var draw_text_x = x;
var draw_text_y = y;
var draw_text_witdh = text_width;
var portrait_scale =2;
var finished = (text_progress == text_length); 


//Portrait
if (!already_fighting)
{
	var _scaling_y = starting_y-(height/2)*increasing_value;
	
	// Draw the box, it will have a scale animation and will return true when finished 
	draw_blurry_background_gui(x,_scaling_y,width,1+height*increasing_value);
	
	//check if the animation for background reached his limit
	var _background_ready= increasing_value==1;
	
	if (_background_ready)
	{
		if(sprite_exists(portrait_sprite))
		{
			//Shrink text width vy the width the portrait will take up
			draw_text_witdh -= portrait_width*portrait_scale + portrait_x + padding;
	
			var draw_portrait_x = x + portrait_x;
			var draw_portrait_y = y + portrait_y;
			var draw_portrait_xscale = 1;
	
			//What side is the portrait on?
			if(portrait_side == PORTRAIT_SIDE.LEFT)
			{
				//Shift the text over when the portrait is on the left
				draw_text_x += portrait_width*portrait_scale + portrait_x + padding;
			}
			else 
			{
				//Shift the portrait itself over when it is on the right
				draw_portrait_x = x + width - portrait_width - portrait_x;
				draw_portrait_xscale = -1;
			}
	
			//Draw portrait backing
			//draw_sprite(spr_portrait,0,draw_portrait_x,draw_portrait_y);
	
			//Animate the portrait when typing
			var subimg = 0;
			if(!finished) subimg = (text_progress / text_speed) * (sprite_get_speed(portrait_sprite) / game_get_speed(gamespeed_fps));
	
			draw_sprite_ext(portrait_sprite, subimg,
							draw_portrait_x + (portrait_width*portrait_scale)/2, draw_portrait_y + (portrait_height*portrait_scale)/2,
							draw_portrait_xscale*portrait_scale,portrait_scale,0,c_white,1);
		}

	
		//Speaker
		if(speaker_name != "")
		{
			//Expand the nameplate if the name is wider than the default width
			var name_w = max(string_width(speaker_name), speaker_width)
	
			draw_sprite_stretched(spr_name,0,x + speaker_x, y + speaker_y - speaker_height/2, name_w+15, speaker_height+10);
	
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			//draw_set_font(speaker_font);
			draw_set_color(speaker_color);
			draw_text(x +padding+ speaker_x + name_w/2, y + speaker_y, speaker_name);
		}

		// Text
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);

		draw_set_font(text_font);
		draw_set_color(text_color);

		//type(draw_text_x + text_x, draw_text_y + text_y, text, text_progress, draw_text_witdh);

		draw_set_color(c_gray);
		draw_text_scribble_ext(draw_text_x + text_x-1,draw_text_y + text_y-3,text,draw_text_witdh,text_progress)
		draw_set_color(text_color);
		draw_text_scribble_ext(draw_text_x + text_x,draw_text_y + text_y,text,draw_text_witdh,text_progress)


		//Options
		if(finished && option_count >0)
		{
			draw_set_valign(fa_middle);
			draw_set_color(option_text_color);
	
			for(var i = 0; i < option_count ; i++)
			{
				var opt_x = x + option_x;
				var opt_y = y + option_y - (option_count - i - 1)*option_spacing;
		
				//Selected option is indented with an arrow
				if( i == current_option)
				{
					opt_x += option_selection_indent;
					draw_sprite(spr_textbox_arrow,0,opt_x - 20,opt_y - 10);
				}
		
				draw_sprite_stretched(sprite_index,1,opt_x,opt_y - option_height/2,option_width,option_height);
				draw_text(opt_x + option_text_x,opt_y,options[i].text);
			}
		
		}
	}
}
