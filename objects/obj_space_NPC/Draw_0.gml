/// @description Insert description here
// You can write your code in this editor

if(global.beat) image_index++;

if(!instance_exists(obj_fight_control))
{
    draw_self(); 
}

if(instance_exists(o_player))
{
	var _dis=point_distance(self.x,self.y,o_player.x,o_player.y);
	//if (_dis>=40) instance_destroy();
}


