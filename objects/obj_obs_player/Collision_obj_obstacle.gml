/// @description Insert description here
// You can write your code in this editor
if (!invulnerable)
{
	hola=10;
	got_hit=true;
    invulnerable=true;
	global.playerhealth-=1;
	alarm[0]=room_speed*invulnerable_delay;

}

