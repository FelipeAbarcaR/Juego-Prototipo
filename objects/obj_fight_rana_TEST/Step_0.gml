/// @description Insert description here
// You can write your code in this editor

switch(state)
{
    case fight_state.wait:
	sprite_index=fight_sprite_wait;
	if(global.beat)
	{
		wait_count++
		if(wait_count>=wait_max)
		{
		    current_move=fight_choose_random_attack();
			current_point=0;
			x_from=x_start;
			y_from=y_start;
			state=fight_state.prepare;
			beat_start_prepare=global.BeatNumber;
		}
	}
		
	break;
	case fight_state.prepare:
	
		status_immunity=true;
		
		var _x=moves[current_move][current_point][2];
		var _y=moves[current_move][current_point][3];
		var _progress=fight_move_to_point(_x,_y);
		
		if(global.beat)
		{
		    if(beat_start_prepare!=global.BeatNumber)
			{
			    current_point++;
				if(moves[current_move][current_point][1]==2) state=fight_state.attacking;
			}
		}

		
	break;
	
	case fight_state.attacking:
		status_immunity=true;
		status_attacking=true;
		
		//move to poing
		var _x=moves[current_move][current_point][2];
		var _y=moves[current_move][current_point][3];
		var _progress=fight_move_to_point(_x,_y);
		
		//next point if is on beat
		if(global.beat)
		{
		    if(beat_start_prepare!=global.BeatNumber)
			{
			    current_point++;
				if(moves[current_move][current_point][1]==0) state=fight_state.wait;
				
				hola=10;
			}
		}
		
	break;
	
	case fight_state.stun:
	break;
	
	case fight_state.locked:
	break;
	
}








