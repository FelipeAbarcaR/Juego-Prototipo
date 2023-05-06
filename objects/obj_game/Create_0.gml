randomize();

global.gamepaused = false;
global.textspeed = .75;
global.icamara = instance_create_layer(0,0,layer,obj_camera);
global.iUI = instance_create_layer(0,0,layer,obj_UI);
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.playerhealthmax = 3;
global.playerhealth = global.playerhealthmax;
global.playermoney = 0;
global.textover = false;


surface_resize(application_surface,RESOLUTION_W,RESOLUTION_H);

room_goto(ROOM_START);







