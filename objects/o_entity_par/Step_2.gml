/// @description Update my layers

//Did l move up or down
if(visible && y != yprevious)
{
	//am I in the room
	if(y >= 0 && y <room_height)
	{
		//Update
		Update_layers();
	}
	
}


