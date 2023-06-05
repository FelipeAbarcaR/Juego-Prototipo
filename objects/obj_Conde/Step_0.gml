/// @description states,animate,dodge,*hit
// You can write your code in this editor

	Izquierda=keyboard_check_pressed(vk_left);
	Derecha=keyboard_check_pressed(vk_right);
	Arriba=keyboard_check_pressed(vk_up);
	Abajo=keyboard_check_pressed(vk_down);

//change image index through rhythm

	FightRhythmAnimate();

// Check for key pressed
	inputmagnitude=(Izquierda||Derecha||Abajo||Arriba);


//change states

	if (state="idle" && global.beatchance){
		//dodge check
		if(Izquierda+Arriba+Abajo==1 && Derecha==0){
					
			if Arriba
			{
				y_to=y-dodge_distance;
				delay=dodge_delay;
			}
			
			if Abajo
			{
				y_to=y+dodge_distance;
				delay=dodge_delay;
			}
			
			if Izquierda
			{
				x_to=x-dodge_distance;
				delay=back_dodge_delay;
			}
			state="dodge";
		}
		//attack check
		if(Izquierda+Arriba+Abajo==0 && Derecha){
			image_index=0;
			sprite_index=spr_atk1;
			x_to=x+attack_distance;
			state="attack";
		}
	}
//states
	if (state =="dodge"){
		x+=min(abs(x_to-x),dodge_speed)*sign(x_to-x);
		y+=min(abs(y_to-y),dodge_speed)*sign(y_to-y);
		if (sign(x_to-x)==0 and sign (y_to-y)==0){
			start_delay=true;
			state="delay";
		}
	}
	if (state=="delay" && start_delay=true){
		start_delay=false;
		alarm[0]=room_speed*delay
	}
	if (state=="attack")
	{
		x+=min(abs(x_to-x),dodge_speed)*sign(x_to-x);
		if (sign(x_to-x)==0 and image_speed=0){
			delay=attack_delay
			start_delay=true;
			state="delay";
		}
	}
	if (state=="stun" && start_delay=true)
	{
		start_delay=false;
		sprite_index=spr_hurt;
		image_speed=1;
		alarm[0]=room_speed*hit_delay;
	}
	if (state=="dead")
	{
		sprite_index=spr_dead;
		image_speed=1;
		if(image_index>=image_number-1)image_speed=0;
		
	}
	if (state=="stop")
	{
		x=xstart;
		y=ystart;
		sprite_index=spr_idle;
	}
//check collition
if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_Conda, false, false))
{
	//ATAQUE DEL JUGADOR AL ENEMIGO
	if (global.enemy_hit) // si el enemigo puede ser golpeado
	{
		with(obj_Conda)
		{
			global.enemy_hurt=true;
			hp-=obj_Conde.DMG;
		}
	}
	//ATAQUE DEL ENEMIGO AL JUGADOR
	if (global.enemy_atk and !invincible) //si el enemigo está atacando y pj vulnerable
	{
		invincible=true;
		start_delay=true;
		state="stun";
		hp-=obj_Conda.DMG;
		global.enemy_atk=false;
		if (hp<=0) state="dead";
	}
}