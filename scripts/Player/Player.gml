function PlayerAnimateSprite(){
	//Update Sprite
	
	//cuanto frames tenemos en una animacion en particular
	var _totalframes = sprite_get_number(sprite_index) /4;
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
	if(tilemap_get_at_pixel(collisionmap, x + hSpeed, y))
		{
	x -= x mod TILE_SIZE;
	//la funcion sign retorna el signo de el numero 1 siendo positivo y -1 negativo
	if(sign(hSpeed) == 1) x += TILE_SIZE - 1;
	hSpeed = 0;
	_collision = true;
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
	if(tilemap_get_at_pixel(collisionmap, x, y+ vSpeed))
		{
	y -= y mod TILE_SIZE;
	//la funcion sign retorna el signo de el numero 1 siendo positivo y -1 negativo
	if(sign(vSpeed) == 1) y += TILE_SIZE - 1;
	vSpeed = 0;
	_collision = true;
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

function PlayerStateFree(){
	//MOVIMIENTO
	hSpeed = lengthdir_x(inputmagnitude*speedWalk, inputdirection);
	vSpeed = lengthdir_y(inputmagnitude*speedWalk, inputdirection);

	PlayerCollision();	
	//Update sprite index

	//el var es para crear una variable temporal en esta funcion
	var _oldsprite = sprite_index ;
	if(inputmagnitude != 0)
		{
		direction = inputdirection;
		sprite_index = spriterun;
		}
	else sprite_index = spriteidle;

	if(_oldsprite != sprite_index) localframe = 0;

	//Udpate Image Index
	PlayerAnimateSprite();
	
	if(keyattack)
	{
		state = PlayerStateAttack;
		stateattack = AttackSlash;
	}
	
	if(keyactivate)
		{

			var _activateX = x +lengthdir_x(10, direction);
			var _activateY = y +lengthdir_y(10, direction);
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
					activate = _check;
					_entitiesfound = 0; // _entitiesfound = 0 es lo mismo
				}
			}
					
			ds_list_destroy(_activatelist);
			
			if(activate != noone)
	
			{
				//Activar la entidad
				ScriptExecuteArray(activate.EntityActivateScript, activate.EntityActivateArgs);
				
				//Hace que en NPC mire hacia el jugador
				if(activate.EntityNPC)
				{
					with(activate)
					{
							direction = point_direction(x,y,other.x,other.y);
							image_index = CARDINAL_DIR;
					}
				}
			}
		}
}

function PlayerStateTransition(){
	
	//Movimiento
	PlayerCollision();
	
	//Update Image Index
	PlayerAnimateSprite();	
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