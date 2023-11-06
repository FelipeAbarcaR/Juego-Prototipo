/// @description Change type of player
// You can write your code in this editor

player_move=o_player;
player_grid=obj_crypt_player;
player_obs=obj_obs_player;

player_state_changed=false;

var _exist=function(_instance)
{
    try
	{
		var _value=_instance.x;
		return true;
	} catch (_error)
	{
		return false;
	}
}
var finish = function()
{
	player_state_changed=true;
	show_debug_message("destruyendo obj_player_manager")
    instance_destroy();
}

//change from move to grid
if(instance_exists(player_move) && !player_state_changed)
{
	var _old_player,_new_player,_x,_y;
	_old_player=player_move;
	_new_player=player_grid;
	_x=_old_player.x;
	_y=_old_player.y;
    //instance_deactivate_object(_old_player);
	
	//create new player and destroy old one
	var _lay_id=layer_get_id("Instances")
	instance_create_layer(_old_player.x,_old_player.y,_lay_id,_new_player);

	instance_destroy(_old_player);
	show_debug_message("obj_player_manager: Creando " + object_get_name(_new_player)+"y destruyendo "+ object_get_name(_old_player));


	//set camera to follow the new player
	uc_set_instance_following_list(_new_player);
	
	finish();
	
}
//change from grid to move
if(instance_exists(player_grid) && !player_state_changed)
{
	var _old_player,_new_player,_x,_y;
	_old_player=player_grid;
	_new_player=player_move;
	_x=_old_player.x;
	_y=_old_player.y;
    //instance_deactivate_object(_old_player);
	
	//create new player and destroy old one
	var _lay_id=layer_get_id("Instances")
	instance_create_layer(_old_player.x,_old_player.y,_lay_id,_new_player);
	//_new_player.x=_old_player.x;
	//_new_player.y=_old_player.y;
	instance_destroy(_old_player);
	show_debug_message("obj_player_manager: Creando " + object_get_name(_new_player)+"y destruyendo "+ object_get_name(_old_player));

	//set camera to follow the new player
	uc_set_instance_following_list(_new_player);
	
	finish();
	
}



