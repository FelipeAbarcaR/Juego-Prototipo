 var draw_text_x = x;
var draw_text_y = y;
var draw_text_width = text_width;
var _textbox_height=height;
var portrait_scale =1;
var finished = (typist.get_state()==1);



if (event_mode==textbox_event.TEXTING)
{
	//Background
	// Draw the box, it will have a scale animation and will return true when finished
	
	var _scaling_y = starting_y-(height/2)*increasing_value;
	
	switch(bg_type)
		{
		    case BG_TYPE.npc:
				draw_sprite_stretched(bg_NPC_sprite,bg_index,x,_scaling_y,width,1+height*increasing_value);
			break;
		
			case BG_TYPE.blurry:
				draw_blurry_background_gui(x,_scaling_y,width,1+height*increasing_value);
			break;
		
			case BG_TYPE.woodsign:
				draw_sprite_stretched(bg_sign_sprite,bg_index,x,_scaling_y,width,1+height*increasing_value);
			break;
		}
	
	
	//check if the animation for background reached his limit
	var _background_ready= increasing_value==1;
	
	if (_background_ready)
	{
		//Portrait
		if(sprite_exists(portrait_sprite))
		{
			//Shrink text width vy the width the portrait will take up
			draw_text_width -= portrait_width + portrait_x + padding;
	
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
			
			var _scribble_speaker=scribble(speaker_name );
			var name_w = max(_scribble_speaker.get_width()+padding*2, speaker_width);
			var name_h= max(_scribble_speaker.get_height()+padding*2,speaker_height);
			//el padding los puse como extra para que calce, en verdad no se pq pero funciona
			//draw_sprite_stretched(spr_name,0,x + speaker_x-name_w/2, y + speaker_y-speaker_height/2, name_w+padding*2, speaker_height+padding*2);
			
			_scribble_speaker.starting_format(speaker_font,#5c2e17);
			_scribble_speaker.draw(draw_text_x+text_x,draw_text_y+text_y);
			_scribble_speaker.starting_format(speaker_font,speaker_color);
			_scribble_speaker.draw(draw_text_x+text_x+2,draw_text_y+text_y+2);
			
			//adjust the text position under the speaker name
			draw_text_y+=name_h;
			_textbox_height-=name_h;
		}

		// TEXT
		//change te position and format of the text depending on the lenght of the text
		//switch between the top left corner of the textbox to the middle center
		if(text_length>=lenght_shift_format)
		{
			scribble_object.align(fa_left,fa_top);
		}
		else
		{
		    scribble_object.align(fa_center,fa_middle);
			draw_text_x=floor(draw_text_x + (draw_text_width/2));
			draw_text_y=y+height/2;//floor(draw_text_y+_textbox_height/2)
		}
		
		var _text_color_1,_text_color_2,_text_font;
		
		switch(bg_type)
		{
		    case BG_TYPE.npc:
				_text_font=text_font_npc;
				_text_color_1=c_gray;
				_text_color_2=c_white;	
			break;
			
			case BG_TYPE.blurry:
				_text_font=text_font_blurry;
				_text_color_1=#3b372b;
				_text_color_2=c_white;
			break;
		
			case BG_TYPE.woodsign:
				_text_font=text_font_sign;
				_text_color_1=#5c2e17;
				_text_color_2=#966941;
			break;
			default:
			_text_font=text_font_npc;
			break;
			
		} 
		//draw the text (typing)
		scribble_object.starting_format(_text_font,_text_color_1);
		scribble_object.wrap(draw_text_width);
		scribble_object.draw(draw_text_x,draw_text_y,typist);
		
		scribble_object.starting_format(_text_font,_text_color_2);
		scribble_object.draw(draw_text_x+2,draw_text_y+2,typist);
		
		if(global.DrawText) draw_circle(draw_text_x,draw_text_y,2,false);
		
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
				_scribble_option.starting_format(_text_font,option_text_color);
				_scribble_option.draw(opt_x+option_text_x,opt_y+padding+2);
				
			}
		
		}
	}
}

if(global.DrawText)
{
    draw_circle(x,y,2,false);
	draw_circle_color(draw_text_x,draw_text_y,2,c_blue,c_blue,false)
}