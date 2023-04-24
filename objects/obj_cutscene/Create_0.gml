scene_info = -1;
scene = 0;

timer = 0;

scene_info = 
[
	[CutSceneInstanceCreate,320,180,"Instances",obj_player],
	[CutSceneWait,2],
	[CutScenemoveCharacter,obj_player,250,180,false,1],
	[CutSceneWait,4],
	[CutSceneInstanceDestroy,obj_player],
];

x_dest = -1;
y_dest = -1;