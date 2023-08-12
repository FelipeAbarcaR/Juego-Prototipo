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

//if not self-desructing himself
if(!minimize_to_destroy)
{
	var confirm=false;

	if (!already_fighting) confirm = keyboard_check_pressed(confirm_key);

	increasing_value=min(1,increasing_value+delta_scaling);

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
	var finished = (text_progress == text_length); 


	// Are we finished typing?
	if (finished) 
	{
		if (option_count > 0)
		{
			var up = keyboard_check_pressed(up_key);
			var down = keyboard_check_pressed(down_key);
		
			//Cycle through available options
			var change = down - up;
			if(change != 0)
			{
				current_option += change;
			
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
		text_progress = text_length;
	}


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
	
	
		//Changeroo
		if (new_room != -1){
			global.targetRoom=new_room;
			RoomTransition(TRANS_TYPE.SLIDE,new_room);
		}
	//FIGHT STUFFS
		//ACTIVAR PELEA
		if (start_fight){
			start_fight=false;
			NewEncounter(fight_enemy,fight_bg);
			already_fighting=true;
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
		DialogueSound()
	}
}else{
	     //decrease the height until 0, then instance destroy
		 increasing_value=max(0,increasing_value-delta_scaling);
		 if(increasing_value<=0) instance_destroy()
	 }

