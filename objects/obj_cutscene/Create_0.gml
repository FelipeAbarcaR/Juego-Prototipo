/*
text
	startdialogue(topic)
camera
	uc_set_mode(mode)
	uc_set_target_x()
	uc_set_target_y()
	uc_set_instance_following_list()
wait
	CutSceneWait(_seconds)
music
	CutSceneChangeMusic(_music)
Camera FX
	uc_shake()
	uc_flash()
Gesture
	set_gesture(_obj,_gesture)
sound effect
	play_sfx(_sfx)
Automove
	CutScenemoveCharacter

*/


action_list=
[
	[CutSceneStart,[],true],
	[uc_set_instance_following_list,[obj_coneja],true],
	[CutSceneWait,[0.4],false],
	[set_gesture,[obj_coneja,GESTURE.Exclamation],true],
	[CutSceneWait,[1],false],
	[set_gesture,[obj_gato,GESTURE.Question],true],
	[startDialogue,["TESTCUTSCENES1"],false],
	[CutScenemoveCharacter,[obj_coneja,1392,1088,false,2],false],
	[startDialogue,["TESTCUTSCENES2"],false],
	[startDialogue,["TESTCUTSCENES3"],false],
	[uc_set_instance_following_list,[obj_jabali],true],
	[startDialogue,["TESTCUTSCENES4"],false],
	[uc_set_instance_following_list,[obj_coneja],true],
	[startDialogue,["TESTCUTSCENES5"],false],
	[uc_set_instance_following_list,[obj_jabali],true],
	[CutSceneWait,[0.2],false],
	[uc_shake,[],true],
	[startDialogue,["TESTCUTSCENES6"],false]
	
	
]

current_action=-1

//waiting=false;

wait_id=id;
activate=obj_coneja;

x_dest=-1;
y_dest=-1;
next = function(call_id)
{
	if(call_id== wait_id || call_id=id)
	{
		
		current_action++;
		if(current_action>=array_length(action_list))
		{
		    CutSceneEnd();
			with (o_player) 
			{
				state = states.IDLE;
			}
			uc_set_instance_following_list(o_player)
			global.cutscene=false;
			instance_destroy();
		}
		else
		{
			o_player.state=states.LOCK;
			run();
		}
	}
}

run =function()
{
    var _script = action_list[current_action][0];
	var _args = action_list[current_action][1];
	var _snap =action_list[current_action][2];

	var _id=ScriptExecuteArray(_script,_args);

	if(_snap)
	{
		next(id);
	}
	else
	{
	    wait_id=_id;
	}

}

next(id);