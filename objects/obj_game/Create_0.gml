randomize();

global.gamepaused = false;
global.textspeed = .75;
//global.icamara = instance_create_layer(0,0,layer,oCameraManager);
global.iUI = instance_create_layer(0,0,layer,obj_UI);
global.DrawText=false;

draw_dragon_head=false;
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

holo=0;
	
//mute bin var
mute=0;
//room data

// Create ds list for inventory

//ds list es como un array pero mas flexible
inv_list = ds_list_create();
Inv_add(ITEM.DASH,1)
//Pausing
pause = false;
pause_surf = -1;

//end fight parameters
delay_to_return_from_fight=0.5;


//transition parameters
changed_room=false;

window_set_cursor(cr_none);

//GAMEOVER
game_over=false;

//gametime
game_time=0;
room_time=0;