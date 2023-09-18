/// @description 
switch(state) {
	default:
		reset_variables();

		get_input();

		calc_movement();
		
		Space_logic();

		anim();
		
		check_alpha_tiles();
		
		check_floor_tiles();
		
		
	break;
	case states.KNOCKBACK:
		reset_variables();

		calc_movement();
		
		if knockback_time-- <= 0 state = states.IDLE;
		
		anim();
	break;
	case states.DEAD:
		reset_variables();

		calc_movement();

		if ready_to_restart and mouse_check_button_pressed(mb_left) game_restart();
		
		anim();
	break;
	case states.ROLL:
		reset_variables();
		
		player_roll();
		
		//collision_bridge();
		
		if(movedistanceremaining <= 0) state = states.IDLE;
		
		anim();
	break;
	case states.LOCK:
		
		reset_variables();
		
		placement_Player_NPC( activate.x + 20 ,activate.y + 30, false, walk_spd/2);
		
	break;
	
}