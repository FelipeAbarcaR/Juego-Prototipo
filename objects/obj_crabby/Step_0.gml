/// @description Insert description here
// You can write your code in this editor

var _collition = point_distance(o_player.x,o_player.y,self.x,self.y)<=60;
if(_collition == true && !found)
{
	image_speed=1;
	var _snd = audio_play_sound(sfx_scratch_TEST,1,0,0.3,54,1);
	audio_sound_gain(_snd, 0.4, 0);
    audio_sound_gain(_snd, 0, 500);
    found=true;
}

if(found==true)
{
	var _direction = point_direction(o_player.x,o_player.y,self.x,self.y);
    self.x+=lengthdir_x(h_speed,_direction);
	self.image_alpha-=alphaing;
	if(self.image_alpha==0) instance_destroy();
}