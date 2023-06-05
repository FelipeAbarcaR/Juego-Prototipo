/// @description arriba
if (moving == true)
{
	y -= jump_speed;
	moving = false;
	alarm[0]= room_speed*back_delay;
}
