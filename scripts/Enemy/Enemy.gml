function EnemyTileCollision(){
	
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

function SlimeWander(){
	
	sprite_index = sprMove;
	
	//At destination or given up?
	
	if((x == xTo) && (y == yTo)) || (timepassed > enemyWanderdistance / EnemySpeed)
	{
		hSpeed = 0;
		vSpeed = 0;
		//end our move animation
		
		if(image_index < 1)
		{
			image_speed = 0.0;
			image_index = 0;
		}
		
		//Set new target destination
		//al poner el ++ a la izquierda de la variable primero sumara +1 y dps vera si cumple con la condicion
		if(++wait >= waitduration)
		{
			wait = 0;
			timepassed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45,45);
			xTo = x + lengthdir_x(enemyWanderdistance, dir);
			yTo = y + lengthdir_y(enemyWanderdistance, dir);
		}
	}
	// move towards new destination
	else
	{
		timepassed++;
		image_speed = 1.0;
		var _distancetogo = point_distance(x,y,xTo,yTo);
		var _speedthisframe = EnemySpeed;
		
		if(_distancetogo < EnemySpeed) _speedthisframe = _distancetogo;
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_speedthisframe, dir);
		vSpeed = lengthdir_y(_speedthisframe, dir);
		
		if(hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Collide & move
		
		EnemyTileCollision();
		
	}
	
	//Check for aggro
	if(++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if(instance_exists(obj_player)) && (point_distance(x,y,obj_player.x,obj_player.y) <= EnemyAggroRadius)
		{
			state = ENEMYSTATE.CHASE;
			target = obj_player;
		}
	}
	
	
}

function SlimeChase(){
	
	sprite_index = sprMove;
	if(instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
		
		var _distancetogo = point_distance(x,y,xTo,yTo);
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		
		if(_distancetogo > EnemySpeed)
		{
			hSpeed = lengthdir_x(EnemySpeed, dir);
			vSpeed = lengthdir_y(EnemySpeed, dir);
		}
		else
		{
			hSpeed = lengthdir_x(_distancetogo, dir);
			vSpeed = lengthdir_y(_distancetogo, dir);
		}
		if(hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Collide and move
		
		EnemyTileCollision();
	}
	
	//Check if close enough to launch an attack
	
	if(instance_exists(target)) && (point_distance(x,y,target.x,target.y) <= EnemyAttackRadius)
	{
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
		
		//target 8pixel past the player
		xTo += lengthdir_x(8,dir);
		yTo += lengthdir_y(8,dir);
	}
	
	
}

function EnemyWait(){
	
	if(++statewait >= statewaitduration)
	{
		statewait = 0;
		state = statetarget;
	}
	
}

function SlimeAttack(){
	
	//How fast to move
	var _spd = EnemySpeed;
	
	//Dont move while still getting ready to jump
	if(image_index <2) _spd = 0;
	
	//Freeze animation while in mid-air and also landing finishes
	//image_index no siempre es un entero / floor redondea hacia abajo
	if(floor(image_index) == 3) || (floor(image_index) == 5) image_speed = 0;
	
	//How far we have to jump
	var _distancetogo = point_distance(x,y,xTo,yTo);
	
	//begin landing end of the animation once were nearly done
	if(_distancetogo < 4) && (image_index < 5) image_speed = 1.0;
	
	//Move
	if(_distancetogo > _spd)
	{
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_spd,dir);
		vSpeed = lengthdir_y(_spd,dir);
		//si image_xscale es -1 hara espejo
		if(hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Commit to move and stop moving if we hit a wall
		if(EnemyTileCollision() == true)
		{
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		if(floor(image_index) == 5)
		{
			statetarget = ENEMYSTATE.CHASE;
			statewaitduration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
	
}
	
function Slimehurt(){
	
	sprite_index = sprHurt;
	var _distancetogo = point_distance(x,y,xTo,yTo);
	if(_distancetogo > EnemySpeed)
	{
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(EnemySpeed,dir);
		vSpeed = lengthdir_y(EnemySpeed,dir);
		if(hSpeed != 0) image_xscale = -sign(hSpeed);
		
		//Collide & move, if theres a collision, then stop knockback
		
		if(EnemyTileCollision())
		{
			//esto hace que te quede en el mismo lugar
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		if( stateprevious != ENEMYSTATE.ATTACK) state = stateprevious;
		else state = ENEMYSTATE.CHASE;
	}
	
}

function SlimeDie(){
	
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distancetogo = point_distance(x,y,xTo,yTo);
	
	if(_distancetogo > EnemySpeed)
	{
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(EnemySpeed, dir);
		vSpeed = lengthdir_y(EnemySpeed, dir);
		if(hSpeed != 0) image_xscale = -sign(hSpeed);
		
		//Collide and move
		EnemyTileCollision();
	}
	else
	{
		x = xTo;
		y = yTo;
	}
	//si el frame en el estamos mas la velocidad del sprite (15) / por la velocidad del juego (60) es mayor o igual a la # de frames del sprite
	if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number)
	{
		instance_destroy();
	}
}

function HurtPlayer(_direction, _force, _damage){
	
	if(obj_player.invulnerable <= 0)
	{
		global.playerhealth = max( 0, global.playerhealth - _damage)
		
		if(global.playerhealth > 0)
		{
			with(obj_player)
			{
				state = PlayerStateBonk;
				direction = _direction - 180;
				movedistanceremaining = _force;
				flash = 0.7;
				invulnerable = 60;
				flashShader = sha_red_flash;
			}
		}
		else
		{
			//kill the player
			with(obj_player) state = PlayerStateDead;
		}
	}		
}