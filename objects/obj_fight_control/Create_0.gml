/// @description hola

enum fighting{
	starting,
	inprogress,
	ending
}

fight_status=fighting.starting;
victory=-1;

//the fight started signal.for obj_beat (for now)
global.fight_music_start=true;
global.start_fight=false;
global.fight_ended=false;
global.fight_victory=-1;

//enemy globals
global.enemy_hit = true; //true: enemy can be hit
global.enemy_atk = false; //true:enemy can do damage
global.enemy_hurt = false; //true: enemy got hurt


//set enemies
fighter1=obj_fight_gato;
fighter2=global.fightEnemy;

//HP BAR PARAMS
//margenes de especio entre la barra de hp y la esquina
marginw=200; //220
marginh=display_get_gui_height()*0.75;

//HP decreasing animation
decreasing=false;
decreasing2=false;
decrease_value=0.01;
width_value=1;
width_value2=1;

background=global.fightBackground;
draw_background=false;

bg_width=global.res.width;
bg_height=global.res.height;

//Part 1 of fight, deactivate all and start fight transition
	//mid transition
if (!global.midTransition)
	{
		global.midTransition = true;
	}
//deactivate objects
deactivated_list=[];
if(instance_exists(obj_guide))
{
    instance_deactivate_object(obj_guide);
	array_push(deactivated_list,obj_guide)
}
	
uc_set_mode(CMODE.STATIC);

var _x=0;
var _y=0;

_x =uc_get_x();
_y =uc_get_y();

uc_set_target_x(_x);
uc_set_target_y(_y);

//FightTransitionStart(background,sqFightFadeOut,sqFightFadeIn);
var _end_in = function()
{
    with(obj_fight_control)
	{
		draw_background=true;
		create_fighters=true;
	}
	
	var _end_out = function()
	{
		global.midTransition = false;
	}
	screen_transition(TR_TYPE.ZOOMBLUR,TR_WAY.OUT,true,c_white,_end_out,1);

}
screen_transition(TR_TYPE.ZOOMBLUR,TR_WAY.IN,false,c_white,_end_in,1);

//beat count to start fight (or create hand)
beat_count=0;
beats_to_start=3;
beat_counting=false;

//mid transition parameters
time_transition_in=0.3;
create_fighters=false;
fighters_created=false;

//ending parameters
destroy_fighters=false;

camera_recorder=instance_create_depth(x,y,depth,obj_fight_recorder)

