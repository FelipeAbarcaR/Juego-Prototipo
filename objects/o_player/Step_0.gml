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
		
		//image_speed=0;
		image_index = CARDINAL_DIR_PLAYER;
		
	break;
	
	case states.AUTOMOVING:
		reset_variables();
		
		player_automove();
		
		anim();

	break;
}