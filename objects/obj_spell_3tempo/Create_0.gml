/// @description Insert description here
// You can write your code in this editor

image_index=38;
image_speed=0;
// Inherit the parent event
event_inherited();

spell_cooldown=SPELL_3TEMPO_COOLDOWN;
spell_active_time=SPELL_3TEMPO_ACTIVE;

sounds=[
sfx_shake1,
sfx_shake2,
sfx_shake3
];

sound_index=0;
sounds_end=false;

starting_beat=global.BeatNumber+global.beatprogress;
beat_track=0;

play = function()
{
	if(!sounds_end)
	{
	    play_sfx(sounds[sound_index]);
		sound_index++;
		if(sound_index>=array_length(sounds)) sounds_end=true;
	}
}
//play();


if(player==obj_fight_gato)
{
	with(obj_fight_gato)
	{
		image_index=0;
		sprite_index=spr_gato3_atacando1;
		x_to=x+attack_distance;
		state="3tempo";
		tempo_starting_beat=global.BeatNumber+global.beatprogress;
	}
	play();
	instance_destroy();
	
}

if(player==o_player)
{
	with(o_player)
	{
		state=states.TEMPO;
		tempo_starting_beat=global.BeatNumber+global.beatprogress;
	
	}
	instance_destroy();
}

instance_destroy()