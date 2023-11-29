/// @description Insert description here
// You can write your code in this editor


step_time+=step_speed;

if(step_time>=step_reset)
{
    step_time=0;
	if(current_row+1<array_length(map))
	{
		current_row++;
		uc_shake(3);
	}
	
}

if((current_row>=array_length(map)-1) && !rumble_done)
{
	rumble_done=true;
    if(instance_exists(obj_cutscene)) obj_cutscene.next(id);
}










