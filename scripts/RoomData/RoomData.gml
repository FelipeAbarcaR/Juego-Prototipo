
//room control

	global.currentroom=0;
	global.previousroom=global.currentroom;
	
	//Room data rooms index in Macros (enum) 
	//room_data=[room_name, Music, BPM, obj_to_follow, room_mode,mainChar]
	global.room_data = [
		[roomMapaInicial,	bgm_ForestTime,			126,	o_player,			mode.move,		o_player],
		[roomMapa1,			bgm_WillPower_89,		89 ,	o_player,			mode.move,		o_player],
		[rm_Obstacle1,		bgm_OneLove,			107,	obj_crypt_player ,	mode.grid,		obj_crypt_player],
		[rm_GD,				bgm_boss_01,			127,	obj_obs_player,		mode.obstacle,	obj_obs_player],
		[roomViejoSabio,	bgm_ForestTimeInterior, 126,	o_player,			mode.move,		o_player],
		[roomMapa1Dungeon,	bgm_NightCall_118,		118,	o_player,			mode.move,		o_player]
	];
	
	global.room_count=array_length(global.room_data);
	
	enum rm
	{
		inicial,
		fight,
		obstaculos,
		viejosabio,
	}