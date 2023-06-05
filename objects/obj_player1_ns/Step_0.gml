/// @description restart, game over

//restart (Fin)
if keyboard_check(vk_end)
{
	game_restart();
}

//game over

if (hp <= 0)
{
	instance_deactivate_all(1);
	instance_deactivate_object(obj_player1_ns);
}
