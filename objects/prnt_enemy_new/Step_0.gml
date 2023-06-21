/// @description 
switch(state) {
	case states.IDLE:
		calc_entity_movement();
		check_for_player();
		if path_index != -1 state = states.MOVE;
		enemy_anim();
	break;
	case states.MOVE:	
		calc_entity_movement();	
		check_for_player();
		check_facing();
		if path_index == -1 state = states.IDLE;		
		enemy_anim();		
	break;
	case states.KNOCKBACK:
		calc_knockback_movement();	
		enemy_anim();	
	break
	case states.ATTACK:
		calc_entity_movement();	
		perform_attack();
		check_facing();
		enemy_anim();	
	break
	case states.DEAD:
		calc_entity_movement();	
		enemy_anim();	
		if fade_time-- <= 0 {
			image_alpha-=0.05;
			if image_alpha <= 0 instance_destroy();
		}
	break;
}