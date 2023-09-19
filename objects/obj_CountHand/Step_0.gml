/// @description Insert description here
// You can write your code in this editor
var BeatProgress=min((obj_beat.SumDelta/global.BeatTimeMS),1);
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
		move=false;		
		global.start_fight=true;
		instance_destroy();
	}
}
var _finish_count=(image_index>=EndingSpriteIndex[4])
if(_finish_count && !players_activated)
{
    players_activated=true;
	
	var _player;
	if(instance_exists(o_player))
	{
		o_player.state=states.IDLE;
	}
	if(instance_exists(obj_crypt_player))
	{
	    obj_crypt_player.state="move";
	}
	
	if(instance_exists(obj_obs_player))	
	{
	    obj_obs_player.state=states.IDLE;
	}
	
	if(instance_exists(obj_CryptManager))
	{
	    obj_CryptManager.hand_signal=true;
	}
}