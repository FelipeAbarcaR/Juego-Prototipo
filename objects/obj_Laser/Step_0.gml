/// @description Insert description here
// You can write your code in this editor

if (global.beat) 
{
	beatcount+=1;

	if (beatcount>beatwait && image_index<2){
			image_index+=1;
			beatcount=1;
			}	
	}
	
	if (image_index>=image_number-1){
		image_index=0
		image_speed=0;
		beatcount=0;
	}
	if (image_index==2){
	image_speed=1;
} 