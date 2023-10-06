/// @description Insert description here
// You can write your code in this editor

var keyUp=(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")));
var keyDown=keyboard_check_pressed(vk_down)|| keyboard_check_pressed(ord("S"));
var keyLeft=keyboard_check_pressed(vk_left)|| keyboard_check_pressed(ord("A"));

if (y<ystart)
{
	var _acc=acc_gravedad+hola;
    gravedad=gravedad*(1+_acc);
	y=y+min(gravedad,ystart-y);
	if(y==ystart && state == states.JUMP) state=states.IDLE;
} else 
{
    gravedad=gravedad_inicial;
	y=ystart;
}

//var _handexists=instance_exists(obj_CountHand);
//if (_handexists)
//{

//    state = states.IDLE;
//}


if (state == states.IDLE)
{
	if (keyUp)	 state = states.JUMP;
	if (keyDown){
		state = states.CROUCH;
		image_index=0;
	}
	if (keyLeft)
	{
	    state = states.ROLL;
		image_index=0;
	}
	if(keyUp+keyDown+keyLeft>0)
	{
	    draw_vanish_beatbar();
	}
}


switch(state)
{
    case states.IDLE:
		sprite_index=idle_sprite;
		
		image_speed=1;
		break;
		
	case states.JUMP:
		sprite_index=jump_sprite;
		image_speed=0;
		image_index=0;
		y-=jump_hspeed;
		break;
		
	case states.ROLL:
		image_speed=1;
		y-=roll_hspeed;
		sprite_index=roll_sprite; 
		break;
		
	case states.CROUCH:
		sprite_index=crouch_sprite;
		y=ystart+crouch_z;
		break;	
	
	case states.LOCK:
		
		sprite_index=idle_sprite;
		image_speed=1;
		break;
		
	default:
		break;
}

if(state!=states.JUMP)
{
	if (state==states.LOCK)
	{
	    // code here
	}else
	{
	    if(image_index>=image_number-1) state= states.IDLE;
	}
}