/// @description atacar
if (moving == true)
{
	sprite_index = spr_fighter2_atk;
	image_index = 0;
	x += 160;
	alarm[2] = room_speed*0.1;
	alarm[0] = room_speed*back_delay;
	moving = false;
}