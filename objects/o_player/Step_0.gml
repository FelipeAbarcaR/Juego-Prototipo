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
		image_speed=0;
		//direction = last_direction //point_direction(x,y,global.activate.x,global.activate.y);
	
		//image_index = CARDINAL_DIR_PLAYER;

		reset_variables();

		
	break;
	
	case states.AUTOMOVING:
	
		//reset_variables();
		
		player_automove();
		
		anim();

	break;
	
	case states.TEMPO:
		image_speed=0;
		var _beat_progress=global.BeatNumber+global.beatprogress-tempo_starting_beat;
		var _tempos = tempo_count<3;
		if(_beat_progress>=0.5*tempo_count &&_tempos)
		{
			dashing=true;
			var _tempo_dis=tempo_dash_distance;
			
			if(global.groovy)_tempo_dis=_tempo_dis*tempo_groovy_multiplier; 
			tempo_dash_remain_distance=_tempo_dis;
			play_sfx(tempo_shake_sounds[tempo_count]);
			tempo_count++;
			
		}
		if(dashing)
		{
			var _x_to=x+lengthdir_x(tempo_dash_remain_distance,dir);
			var _y_to=y+lengthdir_y(tempo_dash_remain_distance,dir);
			if(tempo_dash_remain_distance<=tempo_dash_speed)
			{
				x=_x_to;
				y=_y_to;
				tempo_dash_remain_distance=0;
				if(tempo_count>=3)
				{
				    state=states.IDLE;
					tempo_count=0;
				}
				dashing=false;
			}else
			{
				x=x+lengthdir_x(tempo_dash_speed,dir);
				y=y+lengthdir_y(tempo_dash_speed,dir);
				tempo_dash_remain_distance-=tempo_dash_speed;
				var _inst=instance_create_depth(x,y,depth,obj_vanish);
				_inst.sprite_index=self.sprite_index;
				_inst.image_index=self.image_index
				_inst.vanish=0.04;
			}	
		}
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
