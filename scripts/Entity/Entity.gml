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
	hola=10;
if(instance_exists(o_player))
{
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
		TransitionStart(_roomname,sqSlideOutDiagonal,sqSlideInDiagonal);
		//room_goto(global.targetRoom)
		//RoomTransition(TRANS_TYPE.SLIDE,global.targetRoom)
		//instance_destroy();
		
	}
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
