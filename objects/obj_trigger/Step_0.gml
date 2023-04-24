if(!instance_exists(obj_cutscene))
{
	if(place_meeting(x,y,obj_player))
	{
		CreateCutScene(tsceneinfo);
		instance_destroy();
	}
}