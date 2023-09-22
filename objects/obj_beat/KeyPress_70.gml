/// @description fix beat


if(keyboard_check(vk_control))
{
    if(beat_speed==1) beat_speed=2 else beat_speed=1;
}else beat_fix=(!beat_fix);

if(beat_speed==2) beathitrange=beat_hit_range_slow else beathitrange=beat_hit_range;
