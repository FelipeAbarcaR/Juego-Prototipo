/// @description Insert description here
// You can write your code in this editor
var _value=0;
if(gesture_active) _value=1 else _value = -1;
gesture_scale=clamp(gesture_scale+gesture_scale_speed*_value,0,1)

if(gesture_scale>=1 && gesture!=(-1)) sprite_index=global.gestures[gesture];

image_xscale=gesture_scale;
image_yscale=gesture_scale;

if(gesture_active==false && gesture_scale<=0)
{
	instance_destroy();
	if(global.cutscene) obj_cutscene.next(id);
}

image_index=floor(global.beatprogress*3);

if(char_follow>0)
{
    x = char_follow.x;
	y = char_follow.bbox_top;
}