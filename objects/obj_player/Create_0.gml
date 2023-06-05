state = PlayerStateFree;
hitbyattack = -1;
stateattack = AttackSlash;
laststate = state;


collisionmap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedbonk = 1.5;
speedroll = 3.0;

distancebonk = 40;
distancebonkheight = 24;
distanceroll = 70;
distancerollheight = 12;
z = 0;

localframe = 0;

spriterun = spr_gato3_run;
spriteidle = spr_gato3_idle;
spriteroll = spr_player_roll;

invulnerable = 0;
flash = 0;
flashShader = sha_white_flash;

//Esto es para que el player cuando cambia de room no aparezca en el origen de la otra room si no que en donde esta el cuadrado azul
if(global.targetX != -1)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetdirection;
}

inputmagnitude=0;
