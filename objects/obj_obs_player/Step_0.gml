/// @description Insert description here
// You can write your code in this editor

var keyUp=keyboard_check_pressed(vk_up);
var keyDown=keyboard_check_pressed(vk_down);
var keyLeft=keyboard_check_pressed(vk_left);

if (y<ystart)
{
    gravedad=gravedad*(1+acc_gravedad);
	y=y+min(gravedad,ystart-y);
	if(y==ystart && state ==states.JUMP) state=states.IDLE;
} else 
{
    gravedad=2;
	y=ystart;
}

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
	
	default:
		break;
}

if(state!=states.JUMP)
{
	if(image_index>=image_number-1) state= states.IDLE;
}