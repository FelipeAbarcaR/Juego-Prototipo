function EntityTileCollision(){
	
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
	
function AbrirPuerta(_roomindex){
	
if(instance_exists(o_player))
{
	holo=10;
	if(o_player.state != states.DEAD)
	{
		with(obj_puerta) image_index = 1;
		var _name=index.name;
		var _roomname=global.room_data[_roomindex][_name];
		global.currentroom =_roomindex;
		global.targetRoom = _roomname;
		global.targetX = 160;
		global.targetY = 160;
		global.targetdirection = o_player.dir;
		with(o_player) state = states.IDLE;
		//room_goto(global.targetRoom)
		RoomTransition(TRANS_TYPE.SLIDE,global.targetRoom)
		//instance_destroy();
		
	}
}
}