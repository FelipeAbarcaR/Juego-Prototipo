function PlayerAnimateSprite(){
	//Update Sprite
	
	//cuanto frames tenemos en una animacion en particular
	var _totalframes = sprite_get_number(sprite_index) /8;
	image_index = localframe +(CARDINAL_DIR * _totalframes);

	//nunca animamos el sprite de player sino que aumentamos el localframe
	localframe += sprite_get_speed(sprite_index)/FRAME_RATE;
	
	//si la animaccion hace un buble en el siguiente game step
	if(localframe >= _totalframes)
		{
		animationend = true;
		//esto hace que vuelva al principio de la animacion para volver o no a hacer
		localframe -= _totalframes;
		} 
	else animationend = false;
}

function PlayerCollision(){
	
	var _collision = false;
	var _entitylist = ds_list_create();
	
	//TILES HORIZONTAL
	if(collisionmap!=(-1))
	{
		if(tilemap_get_at_pixel(collisionmap, x + hSpeed, y))
			{
		x -= x mod TILE_SIZE;
		//la funcion sign retorna el signo de el numero 1 siendo positivo y -1 negativo
		if(sign(hSpeed) == 1) x += TILE_SIZE - 1;
		hSpeed = 0;
		_collision = true;
			}
	}
	
	//Entidades Horizontales
	
	var _entitycount = instance_position_list(x + hSpeed, y, prnt_entity, _entitylist, false);
	var _snapX;
	
	while(_entitycount > 0)
	{
		var _entitycheck = _entitylist[| 0]; //ds_list_find_value( _entitylist,0)
		// si la entidad que esta en la posicion 0 tiene true la entity collision
		if(_entitycheck.EntityCollision == true)
		{
			//Moverse lo mas cerca que puedas
			if(sign(hSpeed)==-1) _snapX = _entitycheck.bbox_right+1; 
			else _snapX = _entitycheck.bbox_left -1;
			x = _snapX;
			hSpeed =0;
			_collision = true;
			_entitycount =0;
		}
		ds_list_delete(_entitylist,0);
		_entitycount--;
	}
					
	//Movimiento Horizontal 
	x+= hSpeed;
	
	//CLear list between axis
	ds_list_clear(_entitylist);
	
	//TILES VERTICALES
	if(collisionmap!=(-1))
	{
		if(tilemap_get_at_pixel(collisionmap, x, y+ vSpeed))
			{
		y -= y mod TILE_SIZE;
		//la funcion sign retorna el signo de el numero 1 siendo positivo y -1 negativo
		if(sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
			}
	}
	
	//Entidades Verticales
	
	var _entitycount = instance_position_list(x, y+ vSpeed, prnt_entity, _entitylist, false);
	var _snapY;
	
	while(_entitycount > 0)
	{
		var _entitycheck = _entitylist[| 0]; //ds_list_find_value( _entitylist,0)
		// si la entidad que esta en la posicion 0 tiene true la entity collision
		if(_entitycheck.EntityCollision == true)
		{
			//Moverse lo mas cerca que puedas
			if(sign(vSpeed)==-1) _snapY = _entitycheck.bbox_bottom+1; 
			else _snapY = _entitycheck.bbox_top -1;
			y = _snapY;
			vSpeed =0;
			_collision = true;
			_entitycount =0;
		}
		ds_list_delete(_entitylist,0);
		_entitycount--;
	}
	
	//Movimiento Verticales 
	y+= vSpeed;
	
	ds_list_destroy(_entitylist);
	
	return _collision;
}

function PlayerStateDead(){
	
	hSpeed = 0;
	vSpeed = 0;
	
	// if just arriving in this state
	if(sprite_index != spr_player_die) && (sprite_index != spr_player_dead)
	{
		sprite_index = spr_player_die;
		image_index = 0;
		// numero magico
		image_speed = 0.7;
	}
	
	//animation Ending this frame
	if(image_index + image_speed > image_number)
	{
		if(sprite_index == spr_player_die)
		{
			image_speed = max(0, image_speed - 0.03);
			if(image_speed < 0.07)
			{
				image_index = 0;
				sprite_index = spr_player_dead;
				image_speed = 1.0;
			}
		}
		else
		{
			image_speed = 0;
			image_index = image_number -1;
			global.targetX = -1;
			global.targetY = -1;
			RoomTransition(TRANS_TYPE.SLIDE, roomMapaInicial);
		}
	}
	
}

function PlayerStateAttack(){
	
	script_execute(stateattack);
}
	
function PlayerStateBonk(){
	
	//Movimiento
	hSpeed = lengthdir_x(speedbonk, direction-180);
	vSpeed = lengthdir_y(speedbonk, direction-180);
	

	
	//esto es para que sea 0 y no un numero negativo
	movedistanceremaining = max(0, movedistanceremaining - speedbonk);
	
	//var _collided = PlayerCollision();
	
	//Update Sprite
	sprite_index = spr_gato3_idle;
	image_index = CARDINAL_DIR + 2;
	
	//Cambiar altura
	
	//Cambiar Altura del golpe
	z = sin(((movedistanceremaining / distancebonk) * pi)) * distancebonkheight;
		
	//Cambiar estado
	if(movedistanceremaining <= 0)
		{
		//state = PlayerStateFree;
		z = 0;
		}
}

function play_walk_audio(_terreno){
	
	if(room == roomMapaInicial) path_id = layer_get_id("TilesMain");
	else if (room == roomViejoSabio) path_id = layer_get_id("Tiles_floor");

	if(path_id!=(-1))
	{
		var _map_id = layer_tilemap_get_id(path_id);
		if (_map_id!=(-1)) var _data = tilemap_get_at_pixel(_map_id,x,y) else var _data=-1;
	
		if(!tile_get_empty(_data))
		{
			if (!audio_is_playing(Pasos_4))
			{
				audio_play_sound(Pasos_4,8,false);
			}
		} 
		else
		{
			if (!audio_is_playing(Pasos_2))
			{
				audio_play_sound(Pasos_2,8,false);
			}
		}
	}
}
	
function PlayerUpdateStatus()
{
//check if have dash in inventory
	 var _dash = Inv_hasItem(ITEM.DASH);
	 if (_dash) global.CanDash =true else global.CanDash=false;

}

function reset_variables() {
	
	global.interact = false;
	global.end_interaction = false;
	left = 0;
	right = 0;
	up = 0;
	down = 0;
	vmove = 0;
	hmove = 0;
	walk_spd = initial_walk_spd;
	PlayerUpdateStatus();

	
	//Space Logic 
	ScriptNPCstart = false;
}

function get_input() {
	if (keyboard_check(vk_left)	|| keyboard_check(ord("A")))	left	= 1;
	if (keyboard_check(vk_right)|| keyboard_check(ord("D")))	right	= 1;
	if (keyboard_check(vk_up)	|| keyboard_check(ord("W")))	up		= 1;
	if (keyboard_check(vk_down)	|| keyboard_check(ord("S")))	down	= 1;
	
	if (keyboard_check_pressed(vk_space) || keyboard_check(ord("J")))	global.interact = true;
	
}

function calc_movement() {

	hmove = right - left;	
	vmove = down - up;
	//if (hmove != 0 and vmove != 0)
	//{
	//	walk_spd = diag_walk_spd;
	//}

	if hmove != 0 or vmove != 0 
	{
		//get direction we are moving
		dir = point_direction(0, 0, hmove, vmove);
	
		play_walk_audio();
		
		//get distance we are moving
		hmove = lengthdir_x(walk_spd*(1-walk_friction), dir);
		vmove = lengthdir_y(walk_spd*(1-walk_friction), dir);
	
		//add movement to players position
		
		x += hmove;
		y += vmove;
	}
	
	//apply knockback movement
	x += hsp;
	y += vsp;
	
	//apply drag to knockback
	switch(state) {
		default: var _drag = 0.15;	break;
		case states.DEAD: var _drag = 0.08;	break;
	}	
	hsp = lerp(hsp, 0, _drag);
	vsp = lerp(vsp, 0, _drag);

}

function collision() {
	//set target values
	var _tx = x;
	var _ty = y;
	
	//move back to last step position, out of the collision
	x = xprevious;
	y = yprevious;
	
	//get max distance we want to move
	var _disx = ceil(abs(_tx - x));
	var _disy = ceil(abs(_ty - y));
	
	//ensure we are using integers if we are colliding in the x/y axis
	if place_meeting(x + _disx * sign(_tx - x), y, prnt_solid) x = round(x);
	if place_meeting(x, y + _disy * sign(_ty - y), prnt_solid) y = round(y);
	
	//move as far as in x and y before hitting the solid
	repeat(_disx)
	{
		if !place_meeting(x + sign(_tx - x), y, prnt_solid) x += sign(_tx - x);	
	}
	repeat(_disy)
	{
		if !place_meeting(x, y + sign(_ty - y), prnt_solid) y += sign(_ty - y);
	}
	
}
	
function collision_Entity() {
	//set target values
	var _tx = x;
	var _ty = y;
	
	//move back to last step position, out of the collision
	x = xprevious;
	y = yprevious;
	
	//get max distance we want to move
	var _disx = ceil(abs(_tx - x));
	var _disy = ceil(abs(_ty - y));
	
	//ensure we are using integers if we are colliding in the x/y axis
	if place_meeting(x + _disx * sign(_tx - x), y, obj_sign) x = round(x);
	if place_meeting(x, y + _disy * sign(_ty - y), obj_sign) y = round(y);
	
	//move as far as in x and y before hitting the solid
	repeat(_disx)
	{
		if !place_meeting(x + sign(_tx - x), y, obj_sign) x += sign(_tx - x);	
	}
	repeat(_disy)
	{
		if !place_meeting(x, y + sign(_ty - y), obj_sign) y += sign(_ty - y);
	}
	
}	
	
function tile_alpha(){
	
	var rate = 0.05;
	var _lay_id = layer_get_id("TilesUpperUpper");

		if(_lay_id!=(-1))
		{
			var _map_id = layer_tilemap_get_id(_lay_id);
			if(tilemap_get_at_pixel(_map_id,x,y))
			{
				shader_set(sha_transparent);
				var uni_transparency = shader_get_uniform(sha_transparent,"sha_alpha");
				shader_set_uniform_f(uni_transparency,sha_alpha);
				layer_shader(_lay_id,sha_transparent);
				shader_reset();
			}
		}

}
	
function collision_bridge (){

	var _lenx = lengthdir_x(distanceroll,dir);
	var _leny = lengthdir_y(distanceroll,dir);
	
	if(position_meeting(x + _lenx, y + _leny, o_solid_bridge))
	{
		if(_lenx > 0) x += 30;
		if(_lenx < 0) x -= 30;
		if(_leny > 0) y += 30;
		if(_leny < 0) y -= 30;
	}	
}

function collision_bounce() {
	collision();
	if place_meeting(x + sign(hsp), y, o_solid) hsp = -hsp;
	if place_meeting(x, y + sign(vsp), o_solid) vsp = -vsp;
}

function anim() {
	
	switch(state) {
		default:
			if hmove != 0 or vmove != 0 
			{
				switch(dir)
				{
					case 0: sprite_index =		spr_move_right;			break;		
					case 45: sprite_index =		spr_move_right_up;		break;
					case 90: sprite_index =		spr_move_up;			break;	
					case 135: sprite_index =	spr_move_left_up;		break;
					case 180: sprite_index =	spr_move_left;			break;
					case 225: sprite_index =	spr_move_left_down;		break;
					case 270: sprite_index =	spr_move_down;			break;
					case 315: sprite_index =	spr_move_down_right;	break;
				}
			}
			else
			{
				sprite_index = spr_player_idle;
				switch(dir)
				{
					case 0: image_index = 0 break;
					case 45: image_index = 1 break;
					case 90: image_index = 2 break;
					case 135: image_index = 3 break;
					case 180: image_index = 4 break;
					case 225: image_index = 5 break;
					case 270: image_index = 6 break;
					case 315: image_index = 7 break;
				}	
				
			}
		break;
		case states.DEAD:
			sprite_index = spr_gato3_player; //Cambiar en un futuro
		break;
		case states.ROLL:
			sprite_index = spr_roll;
		break;
		case states.AUTOMOVING:
			if hmove != 0 or vmove != 0 
			{
				switch(dir)
				{
					case 0: sprite_index =		spr_move_right;			break;		
					case 45: sprite_index =		spr_move_right_up;		break;
					case 90: sprite_index =		spr_move_up;			break;	
					case 135: sprite_index =	spr_move_left_up;		break;
					case 180: sprite_index =	spr_move_left;			break;
					case 225: sprite_index =	spr_move_left_down;		break;
					case 270: sprite_index =	spr_move_down;			break;
					case 315: sprite_index =	spr_move_down_right;	break;
					case 360: sprite_index =	spr_move_right;			break;
				}
			}
	}
}

function player_roll(){
	
	
	//Movimiento
	hmove = lengthdir_x(speedroll, dir);
	vmove = lengthdir_y(speedroll, dir);
	
	x += hmove;
	y += vmove;
	
	//esto es para que sea 0 y no un numero negativo
	movedistanceremaining = max(0, movedistanceremaining - speedroll);
	
	var _totalframes = sprite_get_number(sprite_index)/4;
		
	image_index = (CARDINAL_DIR * _totalframes) + min (((1-(movedistanceremaining / distanceroll)) *(_totalframes)), _totalframes - 1);
	//var _collided = PlayerCollision();
	
	z = sin(((movedistanceremaining / distanceroll) * pi)) *distancerollheight;

	//Cambiar estado
	
	//if(_collided)
	//{
	//	state = PlayerStateBonk;
	//	movedistanceremaining = distancebonk;
	//}
}

function Space_logic()
{

	var _activateX = x + lengthdir_x(10, dir);
			
	var _activateY = y + lengthdir_y(10, dir);
			
	var _activatesize = 4;
			
	var _activatelist = ds_list_create();
			
	activate = noone;
			
	var _entitiesfound = collision_rectangle_list(
		_activateX - _activatesize,
		_activateY - _activatesize,
		_activateX + _activatesize,
		_activateY + _activatesize,
		prnt_entity,
		false,
		true,
		_activatelist,
		true
	);
			
	//si la primera instancia que encontramos es la entidad	que podemos levantar o no tiene script: intenta el siguiente
	while(_entitiesfound > 0)
	{
		var _check = _activatelist[| --_entitiesfound];
		if(_check.EntityActivateScript != -1)
		{
			global.activate = _check;
			activate = _check;
			_entitiesfound = 0; 
		}
	}
					
	ds_list_destroy(_activatelist);


	//Activate key logic
	if(global.interact)
		{
			
			if(activate == noone)
			{
					
				if(global.beatchance && global.CanDash) //roll only if player is in beat and if player can dash
				{
					state = states.ROLL;
					
					var _distanceroll,_xto,_yto;
					_distanceroll=distanceroll;								
				    _xto=x+ lengthdir_x(_distanceroll, dir);
				    _yto=y+ lengthdir_y(_distanceroll, dir);
					
				    var _fall=place_meeting(_xto,_yto,o_solid_bridge); //check if it will fall from bridge
					
				    if (_fall) //if falling (no o_solid_bridge in landing)
					{
						var _solid=instance_place(_xto,_yto,o_solid_bridge)
						var _x1=_solid.bbox_left;
						var _x2=_solid.bbox_right;
						var _xmid=_x1+(_x2-_x1)/2;
						var _newx;

						//create new point of landing closer to the edge
						if (_xto >= _xmid) _newx=_x2+8 else _newx=_x1-8;
						var _newdirection = point_direction(x,y,_newx,_yto);
						dir=_newdirection;
						_distanceroll=point_distance(x,y,_newx,_yto);	
					};
					
					movedistanceremaining = _distanceroll;
					
					audio_play_sound(sfx_roll,8,false);
				}
			}
			else
			{
				global.end_interaction = true;
				if(activate.EntityActivateScript == startDialogue)
				{
					with(o_player)
					{
						automove_from_activate=true;
						if(state != states.LOCK && state != states.AUTOMOVING) state = states.AUTOMOVING;
					}
				}
				else
				{
					//Activar la entidad
					ScriptExecuteArray(activate.EntityActivateScript, activate.EntityActivateArgs);
				}
				//Hace que en NPC mire hacia el jugador
				if(activate.EntityNPC)
				{
					with(activate)
					{
							direction = point_direction(x,y,other.x,other.y);
							image_index = CARDINAL_DIR_NPC;
					}
				}
			}
		}
}

function placement_Player_NPC(_x,_y,_relative,_spd){
										//Relativo es que si quiero que se mueva a un punto concreto o si quiero que se mueva relativo a su posicion
	
	if(x_dest == -1)
	{
		if(!_relative)
		{
			x_dest = _x;
			y_dest = _y;
		}
		else
		{
			x_dest = o_player.x + _x;
			y_dest = o_player.y + _y;
		}
	}
	var _xx = x_dest;
	var _yy = y_dest;
	
	xp = x;
	yp = y;
	
	with(o_player)
	{
		var _dir = point_direction(x,y,_xx,_yy);

		if(point_distance(x,y,_xx,_yy) >= _spd)
		{
			var startpath = mp_grid_path(global.mp_grid, path, x,y,_xx,_yy,true)
			
			if(startpath)
			{
				
				var ldirx = lengthdir_x(_spd,_dir);
				var ldiry = lengthdir_y(_spd,_dir);
				
				x+= ldirx;
				y+= ldiry;
				hmove=ldirx;
				vmove=ldiry;
				_dir-=_dir mod 45;
				dir=_dir
			}
			else
			{	
				sprite_index	=	spr_gato3_idle;
				direction		=	point_direction(x,y,global.activate.x,global.activate.y);
				image_index		=	CARDINAL_DIR_PLAYER;
				
				_xx = x;
				_yy = y;
				x_dest = -1;
				y_dest = -1;

				automove_from_activate=false;
				state=states.LOCK;
				
				//Activar la entidad
				ScriptExecuteArray(activate.EntityActivateScript, activate.EntityActivateArgs);
			}	
		}
		else
		{
			sprite_index = spr_gato3_idle;
			direction = point_direction(x,y,global.activate.x,global.activate.y);
			image_index = CARDINAL_DIR_PLAYER;
			x_dest = -1;
			y_dest = -1;
			//Activar la entidad
				ScriptExecuteArray(activate.EntityActivateScript, activate.EntityActivateArgs);
			automove_from_activate=false;
			state=states.LOCK;
		}
	}				
}

function placement_Player(_x,_y,_relative,_spd){
										//Relativo es que si quiero que se mueva a un punto concreto o si quiero que se mueva relativo a su posicion
	if(x_dest == -1)
	{
		if(!_relative)
		{
			x_dest = _x;
			y_dest = _y;
		}
		else
		{
			x_dest = o_player.x + _x;
			y_dest = o_player.y + _y;
		}
	}
	var _xx = x_dest;
	var _yy = y_dest;
	
	xp = x;
	yp = y;
	
	with(o_player)
	{
		var _dir = point_direction(x,y,_xx,_yy);
		if(point_distance(x,y,_xx,_yy) >= _spd)
		{
			var startpath = mp_grid_path(global.mp_grid, path, x,y,_xx,_yy,true)
			
			if(startpath)
			{
				var ldirx = lengthdir_x(_spd,_dir);
				var ldiry = lengthdir_y(_spd,_dir);
				x+= ldirx;
				y+= ldiry;
				hmove=ldirx;
				vmove=ldiry;
				_dir-=_dir mod 45;
				dir=_dir;
				
			}
			else
			{	
				sprite_index = spr_gato3_idle;
				//direction = point_direction(x,y,_xx+1,_yy+1);
				image_index = CARDINAL_DIR_PLAYER;
				_xx = x;
				_yy = y;
				x_dest = -1;
				y_dest = -1;
				automove_x=-1;
				automove_y=-1;
				state=states.LOCK;
				
			}	
		}
		else
		{
			sprite_index	=	spr_gato3_idle;
			//direction		=	point_direction(x,y,_xx+1,_yy+1);
			image_index		=	CARDINAL_DIR_PLAYER;
			x				=	_xx;
			y				=	_yy;
			
			x_dest	=	-1;
			y_dest	=	-1;
			
			automove_x	=	-1;
			automove_y	=	-1;
			state		=	states.LOCK;
	
		}
	}				
}

function player_change(_player=undefined)
{
	//change player from one type to another
	// e.g. from o_player to obj_crypt_player
    instance_create_layer(0,0,"Instances",obj_player_manager);
}

function player_automove()
{
	 if(automove_from_activate)
		{
			placement_Player_NPC( activate.x + 20 ,activate.y + 30, false,walk_spd/2);
		}else
		{
			placement_Player( automove_x, automove_y, false,walk_spd/2);
		}
}