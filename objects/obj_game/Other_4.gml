//Change gamemode
global.gamemode=global.room_data[global.currentroom][Index.mode];

// Change the current room

var roomName = room; // Get the current room's name
var arrayLength = array_length(global.room_data); // Get the length of the room_data array

x=xstart;
y=ystart;

for (var i = 0; i <= arrayLength - 1; i++)
{
	var _check = 0;
	var _obj_to_follow = global.room_data[i,Index.follow];
	
    if (global.room_data[i, Index.name] == roomName) 
	{
		uc_set_instance_following_list(_obj_to_follow);
        global.currentroom = i;
		_check = 1;
		var _camera_mode = global.room_data[i,Index.camera_mode];
		uc_set_mode(_camera_mode);
		uc_set_target_x(_obj_to_follow.x);
		uc_set_target_y(_obj_to_follow.y);
		
        break; // Exit the loop once a match is found
    }
}


#macro TS	8

//get tiles in room
var _w = ceil(room_width / TS);
var _h = ceil(room_height / TS);

//create motion planning grid
global.mp_grid = mp_grid_create(0, 0, _w, _h, TS, TS);


//loop through every tile and add a single solid if it's a wall
var _map=-1;
if(layer_exists("Col2"))
{
	var _lay_id =layer_get_id("Col2");
	_map = layer_tilemap_get_id(_lay_id);
	
}
if(_map!=(-1))//create 1x1 solid
{
//create 1x1 solid
	for (var yy = 0; yy < _h; ++yy) {
	    for (var xx = 0; xx < _w; ++xx) {
		    var _t1 = tilemap_get(_map, xx, yy);
			if (_t1 == 6) {
				instance_create_layer(xx * TS, yy * TS, "Collisions", o_solid);
			}
		}
	}
}
//add solid instances to grid
mp_grid_add_instances(global.mp_grid, o_solid, true);

//loop through grid positions again.  Get solid id and if a solid is to the right, absorb it.

//var _map_marks = layer_tilemap_get_id("Col");
if(_map!=(-1))
{
	for (var yy = 0; yy < _h; ++yy) 
	{
	    for (var xx = 0; xx < _w; ++xx) 
		{
		    var _t1 = tilemap_get(_map, xx, yy);
			if _t1 == 6
			{
				//get solid id at this position(using a smaller tile size, as there is overlap)
				var _inst = collision_point(xx * TS, yy * TS, o_solid, 0, 1);
				//if no solid found, move to the next grid position
				if _inst == noone continue;
			
				//replace the solids to the right 
				with(_inst) 
				{
				
					do 
					{
						var _change = false;
						var _inst_next = instance_place(x + 1, y, o_solid);
						if _inst_next != noone 
						{
							image_xscale++;
							instance_destroy(_inst_next);
							_change = true;
						}
					} until _change == false;	
				
					//merge with any solids above that are the same shape
					var _inst_above = instance_place(x, y - 1, o_solid);
					if _inst_above != noone and _inst_above.bbox_left == bbox_left and _inst_above.bbox_right == bbox_right 
					{
						y = _inst_above.y;
						image_yscale += _inst_above.image_yscale;
						instance_destroy(_inst_above);
					}					
				}
		
			//} else {
			//	//tile is empty, so should we add an enemy	
			//	if random(1) <= 0.1 {
			//		instance_create_layer(xx * TS + TS/2, yy * TS + TS/2, "Enemy", o_enemy);
			//	}
			
			//	//place scuff marks
			//	//each tile has a 20% chance of having a scuff applied
			//	if random(1) <= 0.2 {
			//		//get a random scuff, favouring the first 3 over the line scratch
			//		var _t = choose(96, 96, 97, 97, 98, 98, 99);
			//		//randomly flip the tile to give more variety
			//		_t = tile_set_flip(_t, choose(0, 1));
			//		//set the Tiles_floor_marks tilemap.
			//		//We get the tilemap before the loop to save processing it every time
			//		tilemap_set(_map_marks, _t, xx, yy);
			//	}			
			}
		}
	}
}


//Deactivate player if gamemode != free (activate again in room end)

var _mode=current(Index.mode);

if(_mode==mode.obstacle) instance_deactivate_object(o_player);

//SET COLLISION TILES TO INVISIBLE
if(layer_exists("Col2"))
{
	//collision tiles
	
	var lay_id=layer_get_id("Col2");
	layer_set_visible(lay_id,0);
	
}

if(layer_exists("Collisions"))
{
	//collision tiles
	var lay_id=layer_get_id("Collisions");
	layer_set_visible(lay_id,0);
}
if(layer_exists("Alpha"))
{
	//collision tiles
	var _lay_id=layer_get_id("Alpha");
	layer_set_visible(_lay_id,0);
}

//restart room timer
room_time=0;


//search if this is first time visiting this room
var _rooms_visited=array_length(room_visit_list);

var _visited=false;
for(var i=0;i<_rooms_visited;i++)
{
	if(room_visit_list[0]==room)
	{
		_visited=true;
		break;
	}
}
if(!_visited)
{
	var _room=room;
	array_push(room_visit_list,_room);
		
	switch(_room)
	{
		case roomMapaInicial:
			var _lay_id=layer_get_id("gui_layer_top");
			var _x=uc_get_view_x();
			var _y=uc_get_view_y();
			var _bg=instance_create_layer(_x,_y,_lay_id,obj_background_landscape,{background_type:room})	
		break;
			
		case roomMapa1Talo:
			var _lay_id=layer_get_id("gui_layer_top");
			var _x=uc_get_view_x();
			var _y=uc_get_view_y();
			var _bg=instance_create_layer(_x,_y,_lay_id,obj_background_landscape,{background_type:room})	
		break;
	}
		
}
	
