/// @description Insert description here
// You can write your code in this editor

DMG=20;
TipoATK="TRAP";

//beat move sprite
beatcount=0;
image_speed=0;
image_index=0;
SumDeltaTime=0;

//sprite_index of states (cargando,activado)
sprstates=[1,2]
i=0; //index i
sprite_set_speed(sprite_index, ((global.bpm*4)/(60*beatwait)), spritespeed_framespersecond); //set fps speed of sprite