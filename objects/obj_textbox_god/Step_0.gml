var confirm=false;

confirm= input_check_pressed("accept");


switch (textbox_state)
{
	case textbox_states.dibujando_pt:
	
		var _value=0.99
		if(luma_time<_value)
		{
			luma_time=min(luma_time+luma_time_speed,_value);
			if(luma_time>=_value)
			{
				alarm[0]=1.5*room_speed;
			}
		}
	break;
	
    case textbox_states.creciendo_tb:
		increasing_value=min(1,increasing_value+delta_scaling);
		if(increasing_value>=1)
		{
			textbox_state=textbox_states.escribiendo;
		}
	break;
	
	case textbox_states.escribiendo:
		var typist_state=typist.get_state();
		text_progress = min(text_progress + text_speed, text_length);
		
		// Ignore inputs when delay is active
		if (input_delay > 0) 
		{
			input_delay--;
		
		}
		//check if typewriter finished

		var finished = (typist_state==1);
		
		if(finished)
		{
		    textbox_check_actions();
		}else{
			//play dialogue sounds
			if (typist_state>=0.3) DialogueSound();
		};
		
	break;
	
	case textbox_states.esperando:
	break;
	
	case textbox_states.destruyendose:

		//decrease the image_scaleuntil 0, then instance destroy
		increasing_value=max(0,increasing_value-delta_scaling);	 
		if(increasing_value<=0)
		{
			if(global.cutscene) obj_cutscene.next(id);
			instance_destroy();
		}
	break;
}

