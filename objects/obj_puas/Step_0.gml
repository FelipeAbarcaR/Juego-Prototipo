/// @description Insert description here
// You can write your code in this editor

if (global.beat) 
{
	beatcount+=1;

	if (beatcount>beatwait){
		if (image_index<index_activate)
		{
			image_index+=1;
			beatcount=0;
		}
	}	

}

if (image_index>=2){
	
	var _dt=delta_time;
	delta_sum += _dt;
	var _activeprogress=(delta_sum/active_time);
	image_index=index_activate+frames_active*_activeprogress;
	doing_damage=true;
} else doing_damage = false;

if (image_index>=image_number-1){

		image_index=0;
		image_speed=0;
		beatcount=0;
		delta_sum=0
}	