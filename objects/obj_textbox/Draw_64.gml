var draw_text_x = x;
var draw_text_y = y;
var draw_text_witdh = text_width;
var portrait_scale =1;
var finished = (typist.get_state()==1);



if (event_mode==textbox_event.TEXTING)
{
	//Background
	var _scaling_y = starting_y-(height/2)*increasing_value;
	
	// Draw the box, it will have a scale animation and will return true when finished 
	draw_blurry_background_gui(x,_scaling_y,width,1+height*increasing_value);
	
	//check if the animation for background reached his limit
	var _background_ready= increasing_value==1;
	
	if (_background_ready)
	{
		//Portrait
		if(sprite_exists(portrait_sprite))
		{
			//Shrink text width vy the width the portrait will take up
			draw_text_witdh -= portrait_width + portrait_x + padding;
	
			var draw_portrait_x = x + portrait_x;
			var draw_portrait_y = y + portrait_y;
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
				draw_portrait_x = x + width - portrait_width - portrait_x;
				draw_portrait_xscale = -1;
			}
	
			//move the sprite up if it has speaker name
			var _speaker_height=0;
			if (speaker_name!= "") _speaker_height=speaker_height;
			
			//Draw portrait backing
			//draw_sprite_stretched(spr_portrait,0,draw_portrait_x,draw_portrait_y-_speaker_height,portrait_width,portrait_height);
	
			//Animate the portrait when typing
			var subimg = 0;
			if(!finished) subimg = (text_progress / text_speed) * (sprite_get_speed(portrait_sprite) / game_get_speed(gamespeed_fps));
	
			draw_sprite_stretched(portrait_sprite,subimg,draw_portrait_x ,draw_portrait_y-_speaker_height,portrait_width,portrait_height);	
		}
	
		//Speaker
		
		if(speaker_name != "")
		{
			//Expand the nameplate if the name is wider than the default width
			
			var _scribble_speaker=scribble(speaker_name);
			var name_w = max(_scribble_speaker.get_width()+padding*2, speaker_width);
			var name_h= max(_scribble_speaker.get_height()+padding*2,speaker_height);
			//el padding los puse como extra para que calce, en verdad no se pq pero funciona
			draw_sprite_stretched(spr_name,0,x + speaker_x-name_w/2, y + speaker_y-speaker_height/2, name_w+padding*2, speaker_height+padding*2);
			if(global.DrawText)
			{
			    draw_circle(x+padding+speaker_x,y+speaker_y,3,0);
				draw_circle(x + speaker_x-name_w/2, y + speaker_y-speaker_height/2,3,0);
			}
			
			_scribble_speaker.starting_format(speaker_font,speaker_color);
			_scribble_speaker.align(fa_center,fa_middle);
			_scribble_speaker.draw(x+padding+speaker_x,y+speaker_y+padding);
		}

		// Text
		scribble_object.starting_format(text_font,#5c2e17);
		scribble_object.wrap(draw_text_witdh);
		scribble_object.draw(draw_text_x + text_x,draw_text_y + text_y,typist);
		scribble_object.starting_format(text_font,text_color);
		scribble_object.draw(draw_text_x + text_x+2,draw_text_y + text_y+2,typist);

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
					opt_x += option_selection_indent;
					draw_sprite(spr_textbox_paw,0,opt_x - 30,opt_y-2);
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
	}
}