/// @description Insert description here
// You can write your code in this editor
event_inherited();
DMG=20;
TipoATK="TRAP";

//beat move sprite
beatcount=0;
image_speed=0;
image_index=0;

//active_beats=3; //number of beats it will be doing damage
index_activate=2 //numbers of frame to start activatie animation

active_time=global.BeatTimeMS*active_beats;
delta_sum=0;
frames_active=image_number-index_activate; //number of frames doing damage

//set speed
sprite_set_speed(sprite_index, ((global.bpm*4)/(60*beatwait)), spritespeed_framespersecond); //set fps speed of sprite