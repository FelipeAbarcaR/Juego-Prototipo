/// @description Insert description here
// You can write your code in this editor

var _mode=room_get_mode();

if(_mode==mode.obstacle)
{
    beat_bar_visible=false;
}else beat_bar_visible=true;

if(beats_per_input != 2)
{
    beat_change_speed();
}
