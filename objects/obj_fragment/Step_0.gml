
if(!global.gamepaused)
{
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
	
	//Deteriorate
	deteriorate++;
	if(deteriorate > deteriorateAfter)
	{
		//el alpha ira de 1 a 0 dado que deterioratetime vale 180
		image_alpha -= 1/deteriotateTime;
		if(image_alpha <=0) instance_destroy();
	}
	
	//Friction
	Friction = 0.05;
	if(z==0) Friction = 0.10;
	
	//Move
	x += lengthdir_x(spd,direction);
	y += lengthdir_y(spd, direction);
	if(collisionmap!=(-1))
	{
		if(tilemap_get_at_pixel(collisionmap, x, y)> 0) spd = 0;
	}
	spd = max(spd - Friction, 0);

}