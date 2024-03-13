function EntityTileCollision(){

	if(collisionmap!=(-1))
	{
		var _collision = false;
		if (tilemap_get_at_pixel(collisionmap, x + hSpeed, y))
		{
			x -= x mod TILE_SIZE;
			if(sign(hSpeed) == 1) x += TILE_SIZE -1;
			hSpeed = 0;
			_collision = true;
		}
	
		x += hSpeed;
	
		if(tilemap_get_at_pixel(collisionmap, x, y + vSpeed))
		{
			y -= y mod TILE_SIZE;
			if(sign(vSpeed)== 1) y += TILE_SIZE -1;
			vSpeed =0;
			_collision = true;
		}
	
		y += vSpeed;

		return _collision;
	}
}

function EntityChase(){
	
	sprite_index = sprMove;
	if(instance_exists(obj_player))
	{
		xTo = obj_player.x;
		yTo = obj_player.y;
		
		var _distancetogo = point_distance(x,y,xTo,yTo) - 24 ;
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		
		if(_distancetogo > EntitySpeed)
		{
			hSpeed = lengthdir_x(EntitySpeed, dir);
			vSpeed = lengthdir_y(EntitySpeed, dir);
		}
		else
		{
			hSpeed = lengthdir_x(_distancetogo, dir);
			vSpeed = lengthdir_y(_distancetogo, dir);
		}
		
		if(hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Collide and move
		
		EntityTileCollision();
	}
	
	//Check if close enough to launch an attack
	
	//if(instance_exists(target)) && (point_distance(x,y,target.x,target.y) <= EnemyAttackRadius)
	//{
	//	state = ENEMYSTATE.ATTACK;
	//	sprite_index = sprAttack;
	//	image_index = 0;
	//	image_speed = 1.0;
	//	
	//	//target 8pixel past the player
	//	xTo += lengthdir_x(8,dir);
	//	yTo += lengthdir_y(8,dir);
	//}
	
	
}

function EntityHitDestroy(){
	instance_destroy();
}

function EntityHitSolid(){
	flash = 0.5;
}
	
function AbrirPuerta(_roomindex,_targetX,_targetY){

	if(instance_exists(o_player))
	{
		if(o_player.state != states.DEAD)
		{
			with(obj_puerta) image_index = 1;
			var _name=Index.name;
			var _roomname=global.room_data[_roomindex][_name];
			global.currentroom =_roomindex;
			global.roomTarget = _roomname;
			global.targetX = _targetX;
			global.targetY = _targetY;
			global.targetdirection = o_player.dir;
			with(o_player) state = states.IDLE;
			TransitionStart(_roomname,TR_TYPE.DITHER_CIRCLE_TWOPASS);
			//instance_destroy();
			//screen_transition(TR_TYPE.DITHER_CIRCLE_TWOPASS)//HACER ROOM TRANSITION EN FUNCION DEL OBJ_TRANSITION_MANAGER, Y PONER TARGET X Y TARGET Y, LUEGO ARREGLAR LAS OTRAS PUERTAS.(OBJ_GAME ROOM,START:TARGETX Y TARGET Y A 0, Y OTRAS COSITAS (CUANDO ES PALYER MOVE, O X E Y POR DEFECTO SI ESTAN EN 0))
			if(variable_instance_exists(global.activate,"sound_enter"))
			{
			    play_sfx(global.activate.sound_enter);
			}
		}
	}
}

function OpenGate()
{
	var _gate=obj_gate;
    if(instance_exists(_gate))
	{
	    _gate.gate_activated=true;
	}
}
	
function damage_entity(_tid, _sid, _damage, _time) {
	///@desc	damage the target, and return the dead status
	///@arg tid		real	target_id
	///@arg sid		real	source_id
	///@arg damage	real	howmuch damage to deal
	///@arg time	real	how long to knockback the target
	
	with(_tid) {
		if alarm[hurrtt] > 0 or state == states.DEAD exit;		
		
		hp -= _damage;
		var _dead = is_dead();
		path_end();
		//set knockback distance
		if _dead var _dis = 5 else var _dis = 3;
		var _dir = point_direction(_sid.x, _sid.y, x, y);
		hsp += lengthdir_x(_dis, _dir);
		vsp += lengthdir_y(_dis, _dir);
		calc_path_timer = _time;
		alert = true;
		knockback_time = _time;
		alarm[hurrtt] = hurt_time;
		if !_dead state = states.KNOCKBACK;
		image_index = 0;
		return _dead;		
	}
}

function is_dead() {
	///@desc	checks if the instance running this is dead?	
	
	if state != states.DEAD {
		if hp <= 0 {
			state = states.DEAD;
			hp = 0;
			image_index = 0;
			//set death sound
			switch(object_index) {
				default:
					//play sound
				break;			
			}
			return true;
		}
	} else return true;
}

function check_if_stopped() {
	if abs(hsp) < 0.1 hsp = 0;	
	if abs(vsp) < 0.1 vsp = 0;
}

function show_healthbar() {
	///@desc	show healthbar above entities head
	
	if hp != hp_max and hp > 0 {
		draw_healthbar(x-7, y-16, x+7, y-14, hp/hp_max*100, $003300, $3232FF, $00B200, 0, 1, 1);	
	}	
}


//NPCS

function npc_dialogue_interaction(){
	
	if(global.textover)
	{
		if(self.id == global.activate)
		{
			var _npc = object_get_name(object_index);
			global.npc_follow[$ _npc] = true;
			npc_state = npc_states.FOLLOW;
		
			var _array = global.dialogue_order[$ _npc];
		
			if(is_array(_array) and _array != [])
			{
				//array_delete(_array,0,1);
				var _ready = false;
				
				for(var i =0; i < array_length(_array); i++)
				{
					var _topico_temp = _array[i];
					
					if(_topico_temp != -1)
					{
						if(global.dialogue_loop[$ _topico_temp] == 1) 
						{
							uc_set_mode(CMODE.OBJECT_BORDERS);
							global.textover = false;
							global.activate.EntityActivateScript = startDialogue;
							global.activate.EntityActivateArgs = [_topico_temp];
							_ready = true;
							break;
						}
						else
						{
							array_set(_array,i,-1);
						
							if( i+1 < array_length(_array)) 
							{
								var _topico = _array[i+1];
						
								uc_set_mode(CMODE.OBJECT_BORDERS);
								global.activate.EntityActivateArgs = [_topico];
								global.textover = false;	
								_ready = true;	
								break;
							}
							else
							{
								uc_set_mode(CMODE.OBJECT_BORDERS);
								global.activate.EntityActivateScript = -1;
								global.activate.EntityActivateArgs = [-1];
								global.textover = false;
							}
						}
					}
				}
				
				if(!_ready) 
				{
					uc_set_mode(CMODE.OBJECT_BORDERS);
					global.activate.EntityActivateScript = -1;
					global.activate.EntityActivateArgs = [-1];
					global.textover = false;
				}
			}
			else
			{
				uc_set_mode(CMODE.OBJECT_BORDERS);
				global.textover = false;
			}
		}
	}
	
}

function npc_following_animation(){
	
	var _npc = object_get_name(object_index);

	if(global.npc_follow[$ _npc])
	{
		
		switch(o_player.to_record_sprite[pos_record])
		{
			case spr_gato3_right: sprite_index = sprite_npc_right; image_xscale = 1; break;
			case spr_gato3_left: sprite_index = sprite_npc_left; image_xscale = 1; break;
			case spr_gato3_down: sprite_index = sprite_npc_down; image_xscale = 1; break;
			case spr_gato3_up:	sprite_index = sprite_npc_up;	image_xscale = 1; break;
			
		}
		x = o_player.pos_x[pos_record];
		y = o_player.pos_y[pos_record];
		
		image_speed = o_player.image_speed;
	}
}

function npc_space_bar() {
	
	if(id == global.activate && EntitySpaceBarActive) 
	{
		if(player_active_range)
		{
	//		if(EntityActivateScript == startDialogue)
	//		{
				instance_activate_object(space_bar);
	//		}

			player_active_range=false;
		}
	}else instance_deactivate_object(space_bar)

	if(automoving) automove_entity(x_dest,y_dest,dest_relative,automove_spd);
	if(instance_exists(o_player))
	{
		if(o_player.entity_target!=id)instance_deactivate_object(space_bar)
	}
}
