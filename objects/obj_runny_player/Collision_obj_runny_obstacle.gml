/// @description Insert description here
// You can write your code in this editor

if (other.doing_damage && !inmunity)
{
	if(/*other.object_index==obj_runny_trap &&*/ self.state==states.ROLL)
	{
		//nothing, damage avoided by rolling
	}else
	{
		global.playerhealth-=1;
		inmunity=true;
		damaged=true;
		alarm[2]=room_speed*hit_inmunity_time;
		
	}
}



