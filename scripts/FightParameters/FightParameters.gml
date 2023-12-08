// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.fightBackground		=	-1;
global.fightEnemy			=	-1;
global.fight_ended			=	-1;
global.start_fight			=	-1;
global.fight_victory		=	-1;
global.fight_music_start	=	-1;

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

function Fightplay_sfx(_stance){
	switch(_stance)
	{
		case EnemyStance.prepare:
			var _i=sfx_index;
			audio_play_sound(sfx_prepare[_i],10,0)
			sfx_index++;
			var _len=array_length(sfx_prepare)-1
			if(sfx_index>=_len) sfx_index =0;
		break;
	}

}
