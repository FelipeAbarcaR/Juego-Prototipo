/// @description Insert description here
// You can write your code in this editor

if (image_index >= image_number - 1) instance_destroy();

if(global.fightEnemy!=-1)
{
	if (place_meeting(x , y, global.fightEnemy))
	{		
		if(variable_instance_exists(id,"creator") && !collided)
		{
			if(creator.object_index==obj_fight_gato)creator.attack_collision=true;   
			collided=true;
		}
	}
}
