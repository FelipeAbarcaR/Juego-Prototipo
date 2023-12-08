/// @description trap collition
// You can write your code in this editor

if (other.doing_damage && !inmunity)
{
	if(state=="roll" && other.tipo==trap_type.FLOOR)
	{
		//nothing
	}else
	{
		global.playerhealth-=1;
		inmunity=true;
		damaged=true;
		alarm[0]=room_speed*hit_inmunity_time;
		play_sfx(sound_hit);
		hit_screen_frames=hit_screen_frames_total;
		uc_shake(6);
	}
}	
