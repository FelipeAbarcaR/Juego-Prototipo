/// @description Insert description here
// You can write your code in this editor
if(transition_start)
{
	transition_start=false;
	
	var _callout=function()
	{
	    ready=true;
		room_goto(global.roomTarget);
		show_debug_message("obj_transition_manager: terminado y destruyendose");
		with(obj_beat)
		{
			var _bgm=target(Index.music);
		    audio_stop_all();
			audio_play_sound(_bgm,10,1,bgm_gain);
			current_music= _bgm;			
		}

	}

	transition=screen_transition(transition_type,transition_way,0,transition_colour,_callout);
	transition_progress=0;
	show_debug_message("obj_transition_manager: transición empezando ando");

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
		
	//var _player=o_player;
	//if(instance_exists(_player))
	//{
	//    o_player.state=states.IDLE;
	//}
		
	}
}




