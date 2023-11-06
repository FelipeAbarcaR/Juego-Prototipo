/// @description 
switch(state) {
	default:
		reset_variables();

		get_input();

		calc_movement();
		
		check_spells();
		
		Space_logic();

		anim();
		
		check_tiles();
		
		update_movement();

		
		
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
		direction = point_direction(x,y,global.activate.x,global.activate.y);
		image_index = CARDINAL_DIR_PLAYER;

		reset_variables();

		
	break;
	
	case states.AUTOMOVING:
	
		//reset_variables();
		
		player_automove();
		
		anim();

	break;
}

//HIT EFFECT STUFF
if(inmunity)
{
    blinking_delta_time+=delta_time/1000000;
}
if(damaged)
{
	damaged=false;
    start_flash=true;
}

if(global.groovy)
{
	rainbow_time += 1 / obj_beat.BeatTimeFrames;
	
    if(part_system_exists(rainbow_particle))
	{
		part_system_position(rainbow_particle,x,y);
	} else 
	{
		rainbow_particle=part_system_create(particle_notes);
	    part_system_depth(rainbow_particle,depth-1);
	}
	
}else
{
	if(part_system_exists(rainbow_particle)) part_system_destroy(rainbow_particle);
	
}
