function CharMove() {
	// Movimiento y Sprite
	// indicadores de movimiento
	// se usan en player collision
	hSpeed = lengthdir_x(inputmagnitude * walk_speed, InputDirection);
	vSpeed = lengthdir_y(inputmagnitude * walk_speed, InputDirection);


	// CAMBIAR SPRITE

	Posicion = round(InputDirection/90);
	if (inputmagnitude != 0){
		image_speed = 1;    
	switch (Posicion)
	{
		case 0:
		sprite_index = sprcharright;
		if MirrorWalkSprite image_xscale=1;
		break;
	
		case 1:
		sprite_index = sprcharup;
		if MirrorWalkSprite image_xscale=1
		break;
	
		case 2:
		sprite_index = sprcharleft;
		if MirrorWalkSprite image_xscale=-1;
		break;
	
		case 3:
		sprite_index = sprchardown;
		if MirrorWalkSprite image_xscale=1;
		break;
	
	}
	}
	else {
		if idleanimation {
			if (sprite_index == sprcharup || sprite_index == sprchardown) image_speed=1;
			if (sprite_index == sprcharleft || sprite_index == sprcharright){
				image_speed=0;
				image_index=0;
			}
		} else {
			image_speed=0;
			image_index=0;
		}
	}

	//Choque
	PlayerCollision();

	//DASH
	if(inputmagnitude != 0)
	{
			memory_direction = InputDirection;

	}
	if (global.beatchance and Dash)
	{
		state = CharDash;
		MoveDistanceRemaining = distance_dash;

	}
}