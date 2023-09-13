//Change gamemode
global.gamemode=global.room_data[global.currentroom][Index.mode];

// Change the current room

var roomName = room; // Get the current room's name
var arrayLength = array_length(global.room_data); // Get the length of the room_data array

for (var i = 0; i <= arrayLength - 1; i++) {
	
	var _check = 0;
	
    if (global.room_data[i, Index.name] == roomName) {
        global.currentroom = i;
		_check = 1;
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
var _map = layer_tilemap_get_id("Col2");
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