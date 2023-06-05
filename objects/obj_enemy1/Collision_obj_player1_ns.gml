/// @description recibir daño
if (global.enemy_hit == true)
{
	sprite_index = spr_figther1_hit;
	image_speed = 1;
	global.enemy_hit = false;
}
if (global.enemy_atk)
{
	with(obj_player1_ns){
		sprite_index = spr_fighter2_hit;
		image_speed = 1;
		hp -= global.enemy_damage;
	}
	global.enemy_atk = false;
}