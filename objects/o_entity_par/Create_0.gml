/// @description 
event_inherited();

state = states.IDLE;
inner_state=innerstates.PREACTION;
//init previous positions
xp = x;
yp = y;
facing = 1;
hsp = 0;
vsp = 0;
//how long we are knocked back for
knockback_time = 0;
hurt_time = 30;	//hurt frames
flash_initial = 16;
flash = flash_initial/2;

//create path resource
path = path_add();


