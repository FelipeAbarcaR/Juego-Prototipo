// Get input

var confirm=false;

if (!fighting) confirm = keyboard_check_pressed(confirm_key);

// Type out the text
text_progress = min(text_progress + text_speed, text_length);

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
	
	
	//Changeroom (se debe cambiar a sequence)
	if (new_room != -1){
		global.targetRoom=new_room;
		RoomTransition(TRANS_TYPE.SLIDE,new_room);
	}
	
	//ACTIVAR PELEA
	if (start_fight){
		start_fight=false;
		NewEncounter(fight_enemy,fight_bg);
		fighting=true;
		
	}
}else{
	DialogueSound()
}
