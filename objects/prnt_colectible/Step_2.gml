event_inherited();


//Esto hace que las monedas se esparzan y no queden en el mismo lugar como los fragmentos
flash = max(0, flash - 0.05);
fric = 0.05;
if(z == 0) fric = 0.10;

//Magnetize to player
if(instance_exists(obj_player))
{
	var _px = obj_player.x;
	var _py = obj_player.y;
	var _dist = point_distance(x,y,_px,_py);
	
	//Magent radius
	if(_dist < 16) 
	{
		spd += 0.25;
		direction = point_direction(x,y,_px,_py);
		spd = min(spd,3);
		fric = 0;
		
		//Collect radius
		if(_dist < 5)
		{
			if(collectScriptArg != -1)
			{
				script_execute(collectScript,collectScriptArg);
			}
			else
			{
				if(collectScript != -1) script_execute(collectScript);
			}
			instance_destroy();
		}
	}
}

//bounce
if(bounceCount != 0)
{
	//hay que el grafico de la funcion seno para en entender el rebote
	bounce += (pi * bounceSpeed);
	if(bounce > pi)
	{
		bounce -= pi;
		//cada rebote sera mas pequeño con esto
		bounceHeight *= 0.6;
		bounceCount--;
	}
	z = abs(sin(bounce))* bounceHeight;
}
else z = 0;

x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);
spd = max(spd - fric, 0);
depth = -bbox_bottom;

