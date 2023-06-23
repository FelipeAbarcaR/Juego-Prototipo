if(!collected && place_meeting(x,y,o_player))
{
	//Add to inventory
	Inv_add(inv_type,1)
	
	
	//Collected
	collected = true;
}

//Collected fade away
if(collected)
{
	image_alpha -= 0.05;
	y -= 0.5;
	
	//Destroy
	if(image_alpha < 0.1)
	{
		instance_destroy();
	}
}
//Gravity

if (z < 0)
{
	zspd += 0.5;
	z += zspd;
	
	//Ground collision
	if(z >= 0)
	{
		z = 0;
		zspd = 0;
	}
	
}
	