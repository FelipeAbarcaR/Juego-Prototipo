/// @description fight ended
// You can write your code in this editor

fight_status=fighting.ending;

if(victory)
{
    global.fight_victory=true;
	
}else global.fight_victory=false;

var _end_in = function()
{
	with(obj_fight_control)
	{
		draw_background=false;
		destroy_fighters=true;	
	}
	
	var _end_out = function()
	{
		global.midTransition = false;
		global.fight_ended=true;
		instance_destroy(obj_fight_control);
	}
	screen_transition(TR_TYPE.PIXELIZE,TR_WAY.OUT,true,c_white,_end_out,1);

}
screen_transition(TR_TYPE.PIXELIZE,TR_WAY.IN,false,c_white,_end_in,1);


//FightTransitionReturn(sqFightFadeOut,sqFightFadeIn);
ChangeBGM(obj_beat.last_music);
instance_activate_object(prnt_entity);

