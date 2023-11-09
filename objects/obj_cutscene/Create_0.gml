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




scene_info = -1;
scene = 0;

timer = 0;

action_list=
[
	[CutSceneStart,[],false],
	[CutSceneWait,[4],false],
	[CutScenemoveCharacter,[obj_perro,654,423],false],
	[startDialogueConciencia(),[topic]],
	[uc_set_mode,[CMODE.OBJECT_FOLLOWING],false],
	[uc_set_instance_following_list,[obj_coneja],false],
	[set_gesture,[obj_coneja],false]
]

x_dest = -1;
y_dest = -1;