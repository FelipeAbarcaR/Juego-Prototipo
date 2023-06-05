// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FightRhythmAnimate(){

	//animate thru rhythm
if (state == "idle"){
	image_index=(global.beatprogress)*(image_number-1)
}
if (state=="attack")
{
	image_speed=1;
	if(image_index>=image_number-1) image_speed=0;
	
}

}