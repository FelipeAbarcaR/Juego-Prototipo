
function reset_variables() {
	left = 0;
	right = 0;
	up = 0;
	down = 0;
	vmove = 0;
	hmove = 0;
	interact = false;

	//Roll
	speedroll = 3;
	distanceroll = 70;
	distancerollheight = 12;
	z = 0;
	
	//Space Logic 
	ScriptNPCstart = false;
}

function get_input() {
	if keyboard_check(vk_left)	left	= 1;
	if keyboard_check(vk_right)	right	= 1;
	if keyboard_check(vk_up)	up		= 1;
	if keyboard_check(vk_down)	down	= 1;
	if keyboard_check_pressed(vk_space) interact = true;
	
}

function calc_movement() {
	hmove = right - left;	
	vmove = down - up;

	if hmove != 0 or vmove != 0 {
		//get direction we are moving
		dir = point_direction(0, 0, hmove, vmove);
		
		//get distance we are moving
		hmove = lengthdir_x(walk_spd, dir);
		vmove = lengthdir_y(walk_spd, dir);
	
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
	if place_meeting(x + _disx * sign(_tx - x), y, o_solid) x = round(x);
	if place_meeting(x, y + _disy * sign(_ty - y), o_solid) y = round(y);
	
	//move as far as in x and y before hitting the solid
	repeat(_disx) {
		if !place_meeting(x + sign(_tx - x), y, o_solid) x += sign(_tx - x);	
	}
	repeat(_disy) {
		if !place_meeting(x, y + sign(_ty - y), o_solid) y += sign(_ty - y);
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
					case 0: sprite_index = spr_gato3_right; break;
					case 45: sprite_index = spr_gato3_right_up; break;
					case 90: sprite_index = spr_gato3_up; break;
					case 135: sprite_index = spr_gato3_up_left; break;
					case 180: sprite_index = spr_gato3_left; break;
					case 225: sprite_index = spr_gato3_left_down; break;
					case 270: sprite_index = spr_gato3_down; break;
					case 315: sprite_index = spr_gato3_down_right; break;
				}
			}
			else
			{
				sprite_index = spr_gato3_player;	
			}
		break;
		case states.DEAD:
			sprite_index = spr_gato3_player; //Cambiar en un futuro
		break;
		case states.ROLL:
			sprite_index = spr_player_roll;
		break;
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

function Space_logic(){

	//Activate key logic
	if(interact)
		{

			var _activateX = x + lengthdir_x(10, direction);
			
			var _activateY = y + lengthdir_y(10, direction);
			
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
			
			if(activate == noone)
			{
				//create bar
				with(instance_create_layer(x, y,"Instances",obj_vanish_GUI))
					{
						sprite_index=img_BeatMeter;
					}
					
				if(global.beatchance)
				{
					state = states.ROLL;
					movedistanceremaining = distanceroll;
					audio_play_sound(sfx_roll,8,false);
				}
			}
			else
			{
				if(activate.EntityActivateScript == startDialogue)
				{
					with(o_player)
					{
						//CAMBIAR
						if(state != states.LOCK) state = states.LOCK;
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
		var dir = point_direction(x,y,_xx,_yy);
		
		if(dir >= 0 && dir <= 45) sprite_index = spr_gato3_right;
		if(dir > 45 && dir <= 90) sprite_index = spr_gato3_right_up;
		if(dir > 90 && dir <= 135) sprite_index = spr_gato3_up;
		if(dir > 135 && dir <= 180) sprite_index = spr_gato3_up_left;
		if(dir > 180 && dir <= 225) sprite_index = spr_gato3_left;
		if(dir > 225 && dir <= 270) sprite_index = spr_gato3_left_down;
		if(dir > 270 && dir <= 315) sprite_index = spr_gato3_down;
		if(dir > 315 && dir <= 359) sprite_index = spr_gato3_down_right;
		
			
		if(point_distance(x,y,_xx,_yy) >= _spd)
		{
			var startpath = mp_grid_path(global.mp_grid, path, x,y,_xx,_yy,0)
			
			if(startpath)
			{
				
				var ldirx = lengthdir_x(_spd,dir);
				var ldiry = lengthdir_y(_spd,dir);
				x+= ldirx;
				y+= ldiry;
			}
			else
			{	
				sprite_index = spr_gato3_player;
				_xx = x;
				_yy = y;
				x_dest = -1;
				y_dest = -1;
				//Activar la entidad
				ScriptExecuteArray(activate.EntityActivateScript, activate.EntityActivateArgs);
				
			}	
		}
		else
		{
			sprite_index = spr_gato3_player;
			x_dest = -1;
			y_dest = -1;
			//Activar la entidad
				ScriptExecuteArray(activate.EntityActivateScript, activate.EntityActivateArgs);
	
		}
	}				
}


















