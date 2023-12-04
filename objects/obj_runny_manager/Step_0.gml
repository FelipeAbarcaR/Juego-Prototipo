/// @description Insert description here
// You can write your code in this editor

var _rand=random(n_chance);
if (_rand<=one_chance)
{
	var _x=round(random_range(left_side,right_side));
    instance_create_depth(_x,view_height,depth,obj_runny_trap)
}
time+=delta_time/1000000;

var _array_len=array_length(runny_play_array);

if (time>=runny_play_array[0][0]) && _array_len>1 {

	var _action = runny_play_array[0][1];
	switch(_action)
	{
	    case obstacle.activate:
		global.runny_activate_frenzy=true;
		alarm[0]=room_speed*frenzy_time;
		break;
		
		case obstacle.up:
		var _x=round(random_range(left_side,right_side));
		instance_create_depth(_x,view_height,depth,obj_runny_trap_fury);
		break;
		
		case obstacle.updown:
		var _dragon = obj_runny_dragon;
		
		if(instance_exists(_dragon))
		{
			instance_destroy(_dragon)
		}
		instance_create_depth(460,176,depth,obj_runny_dragon);
		show_debug_message("dragon creados")
		break;
		
		case obstacle.down:
		show_debug_message("llamando al dragon a atacar con rasho")
		if(instance_exists(obj_runny_dragon))
		{
			obj_runny_dragon.type_attack=obj_runny_beam;
		    obj_runny_dragon.attacking = true;
		}
		
		break;
		
		case obstacle.updown2:
		show_debug_message("llamando al dragon a atacar con misil")
		if(instance_exists(obj_runny_dragon))
		{
			obj_runny_dragon.type_attack=obj_runny_dragon_fire;
		    obj_runny_dragon.attacking = true;
		}
		
		break;
		
	}
	
	array_shift(runny_play_array);
} else {
    // Decrease the creation time by the time passed
    //creation_time -= delta_time / 1000000; // Convert delta_time to seconds
}