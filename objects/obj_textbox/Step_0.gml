// Get input

if (!keyboard_check(vk_lcontrol) && keyboard_check_pressed(vk_add)) {
    hola++;
}
if (!keyboard_check(vk_lcontrol) && keyboard_check_pressed(vk_subtract)) {
    hola--;
}
if (keyboard_check(vk_lcontrol) && keyboard_check_pressed(vk_add)) {
    hola2++;
}
if (keyboard_check(vk_lcontrol) && keyboard_check_pressed(vk_subtract)) {
    hola2--;
}

//if not self-desructing himself by minimizing
if(!minimize_to_destroy)
{
	//create scribble's object

	var confirm=false;
	var typist_state=typist.get_state();
	
	// confirm key only works while in texting mode
	if (event_mode==textbox_event.TEXTING) confirm = input_check_pressed("accept");

	//textbox background's increasing value 
	increasing_value=min(1,increasing_value+delta_scaling);

	//start typewriter once the textbox got his maximum height
	if(increasing_value==1)
	{
	    text_progress = min(text_progress + text_speed, text_length);
	}

	// Ignore inputs when delay is active
	if (input_delay > 0) 
	{
		input_delay--;
		exit;
	}
	//check if typewriter finished

	var finished = (typist_state==1);

	// Are we finished typing?
	if (finished) 
	{
		//check if there is options to show
		if (option_count > 0)
		{
			var up = input_check_pressed("up");
			var down = input_check_pressed("down");
		
			//Cycle through available options
			var change = down - up;
			if(change != 0)
			{
				current_option += change;
				play_sfx(sfx_up_down_option);
				
				//Wrap to first and last option
				if(current_option < 0) current_option = option_count -2;
				else if (current_option >= option_count) current_option = 0;
			}
		
			//Select an option!
			if(confirm)
			{
				
				var option = options[current_option];
				options = [];
				option_count  = 0;
				play_sfx(sfx_confirm_option);
				option.act(id);
			}
		
		}
		else if (confirm) 
		{
			next();
		}
	}
	else if (confirm) 
	{
		//if it is typing and the confirm key is pressed, then show the full text
		text_progress = text_length;
		typist.skip();
	}

//stuffs after a dialogue
	if (finished){
	
		//Inventory
		if(item_quantity!=0)
		{
		    switch (sign(item_quantity))
			{
			    case 1:
					var _added=Inv_add(inv_type,item_quantity);
					if (_added)
					{
					    item_quantity=0;
					}else
					{
					    show_debug_message("algo paso con inv_add")
					}
				break;
			
				case -1:
					var _deleted = Inv_del(inv_type,item_quantity);
					if (_deleted)
					{
					    item_quantity=0;
					}else
					{
					    show_debug_message("algo paso con inv_del")
					}
				break;
			
				default:
				break;
				
			}
		}
	
		//Automove
		if(automove_active)
		{
			event_mode	=	textbox_event.MOVING;
			
			o_player.state		=	states.AUTOMOVING;
			o_player.automove_x	=	automove_x;
			o_player.automove_y	=	automove_y;
			var _player	=	o_player;
			
			if(_player.x==automove_x && _player.y==automove_y)
			{
				automove_active=false;
			    next(); 
			}
		}
		if(start_crypt)
		{
		    handcreate();
			player_change();
			beat_change_speed();
			
			next();
		}
		//Changeroom
		if (new_room != -1){
			global.roomTarget=new_room;
			RoomTransition(TRANS_TYPE.SLIDE,new_room);
		}
		//activate stuffs
		if(user_event_index!=(-1))
		{
			event_user(user_event_index);
		    user_event_index=-1;
		}
	//FIGHT STUFFS
		//ACTIVAR PELEA
		if (start_fight){
			start_fight=false;
			NewEncounter(fight_enemy,fight_bg);
			event_mode=textbox_event.FIGHTING;
		}
	//señal de que la pelea terminó, (la activa el obj_game desde alarm 0)
		if (fight_concluded)
		{
			fight_concluded=false;
		    if(global.fight_victory)
			{
			    setTopic(win_topic);
			
			}else 
			{
			    setTopic(lose_topic);
			}

		}
	}else{
		//play dialogue sounds if is not finished typing
		if (typist_state>=0.3) DialogueSound();
	}
}else{
		//if it is minimizing unill destroy, then minimize 'till destroy
	    //decrease the height until 0, then instance destroy
		increasing_value=max(0,increasing_value-delta_scaling);	 
		if(increasing_value<=0)
		{
			if(global.cutscene) obj_cutscene.next(id);
			instance_destroy()
			
		}
	 }

