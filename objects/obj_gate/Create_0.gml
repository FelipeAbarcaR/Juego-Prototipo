/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

enum GATESTATE
{
    open,
	closed,
	opening,
	closing
}

state=GATESTATE.closed;
aranitas=0;
arana=0
posicion_arana=[[17,24],[32,14],[47,24]];

spider_alpha=0

gate_activated=false;


opening_speed=0.06;
opening_distance=20;
opening_progress=0;