/// @description Insert description here
// You can write your code in this editor
var BeatProgress=min((obj_beat.SumDelta/obj_beat.BeatTimeMS),1);
//change index count
if(global.beat && move){
ic+=1;	
}
//wait for beat to start moving
if (StartCounting){
	image_index=0;
	ic=0;
	if global.beat=true{
		move=true;
		StartCounting=false;
	}
}
//move through sprite's frames

if(move){

	if (ic<array_length(EndingSpriteIndex)-1){
		image_index=round(EndingSpriteIndex[ic]+BeatProgress*(EndingSpriteIndex[ic+1]-EndingSpriteIndex[ic]));
} 

	if(image_index>=image_number-1){
		instance_destroy();
		move=false;
	}
}