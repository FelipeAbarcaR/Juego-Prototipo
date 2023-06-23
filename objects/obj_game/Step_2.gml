if(keyboard_check_pressed(vk_escape))
{
	if(!pause)
	{
		pause = true;
		
		//Deactivate instances
		instance_deactivate_all(true);
	}
	else
	{
		pause = false;
		
		//Activate instances
		instance_activate_all();
	}
}