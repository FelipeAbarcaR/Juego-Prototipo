randomize();

global.gamepaused = false;
global.textspeed = .75;
//global.icamara = instance_create_layer(0,0,layer,oCameraManager);
global.iUI = instance_create_layer(0,0,layer,obj_UI);
global.DrawText=false;


global.targetX = -1;
global.targetY = -1;
global.targetdirection = 0;
global.playerhealthmax = 3;
global.playerhealth = global.playerhealthmax;
global.playermoney = 0;
global.textover = false;
global.activate = noone;
global.mp_grid = 0;


global.gamemode=mode.move;


//room control

	global.currentroom=0;
	global.previousroom=global.currentroom;
	
	//Room data rooms index in Macros (enum) 
	//room_data=[room_name, Music, BPM, obj_to_follow, room_mode,mainChar]
	global.room_data = [
		[roomMapaInicial, bgm_ForestTime, 126, o_player, mode.move,o_player],
	    [rm_Obstacle1,bgm_OneLove, 107,obj_CharGrid , mode.grid,obj_CharGrid],
		[roomViejoSabio,bgm_ForestTimeInterior, 107,o_player, mode.move,o_player],
		[rm_GD,bgm_boss_01, 127,obj_obs_player, mode.obstacle,obj_obs_player],
		[roomMapa1,bgm_WillPower_89, 89,o_player, mode.move,o_player]
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

// Create ds list for inventory

//ds list es como un array pero mas flexible
inv_list = ds_list_create();

//Pausing
pause = false;
pause_surf = -1;

//end fight parameters
delay_to_return_from_fight=0.5;

//Start first bgm music
var _bgm = global.room_data[global.currentroom][index.music];
audio_play_sound(_bgm,10,1,0.3);

//transition parameters
changed_room=false;