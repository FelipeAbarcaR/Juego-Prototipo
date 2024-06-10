/// @description Insert description here
// You can write your code in this editor

switch(state)
{
    case fight_state.wait:
		x=xstart;
		y=ystart;
		if(global.beat)
		{
			//wait until some beats and then prepare the next attack
			wait_count++
			if(wait_count>=wait_max)
			{
			    current_move=fight_choose_random_attack();
				current_point=0;
				x_from=x_start;
				y_from=y_start;
				//change state
				state=fight_state.prepare;
				//set the beat where is started this next attack
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
				var _sfx=sfx_prepare[irandom(array_length(sfx_prepare)-1)];
				play_sfx(_sfx,1);
				beat_start_prepare=global.BeatNumber
				x_from=corner_x+moves[current_move][current_point][2];
				y_from=corner_y+moves[current_move][current_point][3];
				x=x_from;
				y=y_from;
			    current_point++;
				if(moves[current_move][current_point][1]==2)
				{
					attack_collision=false;
					state=fight_state.attacking;
					fight_attack_path= fight_set_attack_path(current_move);
					path_start(fight_attack_path,0,path_action_stop,true);
				}
			}
			
		}	
	break;
	
	case fight_state.attacking:
		status_immunity=true;
		status_attacking=true;
		
		var _in_area=false;
		for(var i=0;i<array_length(moves[current_move]);i++)
		{
			if(moves[current_move][i][1]==2)
			{
				var _x=corner_x+moves[current_move][i][2];
				var _y=corner_y+moves[current_move][i][3];
				if(point_distance(x,y,_x+x_atk_offset,_y)<=	10 )
				{
				    _in_area=true;
					if(!attack_effect_launched)
					{
						attack_effect_launched=true;
						play_sfx(Beep);
						SendFX(spr_fx_atk,x-30,y,{sfx:sfx_sword,creator:id});
					}
					
				}
			}
			
		}
		if(!_in_area)attack_effect_launched=false;
		draw_text(xstart,ystart+20,string(attack_effect_launched))
		////move to point through the beat's progress
		if(beat_start_prepare==global.BeatNumber)
		{
			//this will make to follow the path accordingly to the beat progress
			// the max function with map value make a little delay to start moving from point
		    path_position=max(map_value(global.beatprogress,0,1,-0.3,1),0);
		}else
		{
			//play sfx
			var _sfx=sfx_prepare[irandom(array_length(sfx_prepare)-1)];
			play_sfx(_sfx,1);
			//stop the movement, delete the path
		    state=fight_state.locked;
			path_end();
			path_delete(fight_attack_path);
			//wait until restart position in alarm
			alarm[0]=room_speed*global.BeatTimeMS/1000000;
			x_from=x;
			y_from=y;
		}
		if(attack_collision) //si el ataque o el efecto del ataque ha alcanzado al jugador
		{
			attack_collision=false;
			global.enemy_atk=true;
		}
	
	break;
	
	case fight_state.stun:
	break;
	
	case fight_state.locked:
	break;
	
}

if (global.enemy_hurt)
{
	global.enemy_hurt=false;
	global.enemy_hit=false;
	status_hurt=true;
	alarm[1]=room_speed*hurt_delay;
	start_flash1=true;
}

