function CharDash() {

	hSpeed = lengthdir_x(dash_speed,memory_direction);
	vSpeed = lengthdir_y(dash_speed,memory_direction);

	MoveDistanceRemaining = max (0, MoveDistanceRemaining - dash_speed);
	var _collision = PlayerCollision();
	instance_create_layer(x,y,"Instances",obj_char_dash)


	if (MoveDistanceRemaining <= 0)
	{
		state = CharMove;
	}



}