/// @description fix beat


if(keyboard_check(vk_control))
{
    if(beats_per_input==1) beats_per_input=2 else beats_per_input=1;
}else beat_fix=(!beat_fix);

if(beats_per_input==2) beathitrange=beat_hit_range_slow else beathitrange=beat_hit_range;
