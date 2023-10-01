/// @description fight ended
// You can write your code in this editor

if(victory)
{
    global.fight_victory=true;
	
}else global.fight_victory=false;
FightTransitionReturn(sqFightFadeOut,sqFightFadeIn);
ChangeBGM(obj_beat.last_music);
instance_activate_object(prnt_entity);