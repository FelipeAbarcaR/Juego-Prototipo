/// @description trap collition
// You can write your code in this editor

if (obj_prnt_trap.doing_damage && !inmunity)
{
    global.playerhealth-=1;
	inmunity=true;
	damaged=true;
	alarm[0]=room_speed*hit_inmunity_time;
	
}



