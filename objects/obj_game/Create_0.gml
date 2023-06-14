randomize();

global.gamepaused = false;
global.textspeed = .75;
//global.icamara = instance_create_layer(0,0,layer,obj_camera);
global.iUI = instance_create_layer(0,0,layer,obj_UI);
global.DrawText=false;


global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetdirection = 0;
global.playerhealthmax = 3;
global.playerhealth = global.playerhealthmax;
global.playermoney = 0;
global.textover = false;

global.mp_grid = 0;

//surface_resize(application_surface,RESOLUTION_W,RESOLUTION_H);

global.gamemode=mode.move;


//room control

	global.currentroom=0;
	global.previousroom=global.currentroom;
	
	//Room data rooms index in Macros (enum) 
	//room_data=[room_name, Music, BPM, obj_to_follow, room_mode,mainChar]
	global.room_data = [
		[roomMapaInicial, bgm_ForestTime, 126, o_player, mode.move,o_player],
	    [rm_pelea,bgm_Feelings, 115, obj_control_fight , mode.fight,obj_Conde],
	    [rm_Obstacle1,bgm_OneLove, 107,obj_CharGrid , mode.grid,obj_CharGrid],
		[roomViejoSabio,bgm_ForestTimeInterior, 107,o_player , mode.move,o_player],
	
	];
	
	global.room_count=array_length(global.room_data);
	
	enum rm
	{
		inicial,
		fight,
		obstaculos,
		viejosabio,
	}
	
//mute bin var
mute=0;
//room data








