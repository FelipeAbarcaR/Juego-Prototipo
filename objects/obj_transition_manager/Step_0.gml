/// @description Insert description here
// You can write your code in this editor
if(transition_start)
{
	transition_start=false;
	
	var _callout=function()
	{
	    ready=true;
		room_goto(global.roomTarget);
		show_debug_message("terminado y destruyendose");
		with(obj_beat)
		{
		    audio_stop_all();
			var _bgm=target(Index.music);
			audio_play_sound(_bgm,10,1,bgm_gain)
		}
		
		if(global.targetX!=-1 && global.targetY!=-1)
		{
			with(o_player)
			{
			    x=global.targetX;
				y=global.targetY;
			}
		}
	}

	transition=screen_transition(transition_type,transition_way,0,transition_colour,_callout);
	transition_progress=0;
	show_debug_message("transición empezando ando");

}

if(screen_transition_exists(transition))
{
	transition_progress= screen_transition_get_progress(transition);
	show_debug_message(string(transition_progress));
	if(transition_progress==1)
	{
		TransitionResetValues();
		screen_transition_destroy(transition, true);
	    instance_destroy();
	}
}




