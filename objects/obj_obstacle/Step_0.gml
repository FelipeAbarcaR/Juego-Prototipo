/// @description Insert description here
// You can write your code in this editor
x+=obs_speed;
if(distance_active)
{
   var _player = obj_obs_player;
	var _offx	= 16;
	var _active_distance = 200
	var _closer = min(_active_distance,max(abs(x-_player.x)-_offx,0));
	image_index=(1-(_closer/_active_distance))*image_number;
}
if(animated)
{
    image_speed=1;
}

if(x>room_width+50) instance_destroy(self.id);