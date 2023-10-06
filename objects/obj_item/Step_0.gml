var _player=-1;
if(instance_exists(o_player)) _player=o_player;
if(instance_exists(obj_crypt_player)) _player=obj_crypt_player;

if(!collected && _player!=-1 && place_meeting(x,y,_player))
{
	//Add to inventory
	inv_type = item;
	
	var _added = Inv_add(inv_type,1);
	
	//Collected
	collected = _added;
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
	