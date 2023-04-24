with(obj_player)
{
	var sx = 8;
	var sy = 16; 

	//sirve para el 3D para darle depth con el fog
	gpu_set_fog(true,c_black,0,1);

	draw_sprite_pos(sprite_index,image_index,
					x - (sprite_width*0.5) - sx, y - sy,
					x + (sprite_width*0.5) - sx, y - sy,
					x + (sprite_width*0.5),     y,
					x - (sprite_width*0.5),     y,
					0.5
					)
	gpu_set_fog(false,c_white,0,0);
	
}

with(prnt_entity)
{
	var sx = 8;
	var sy = 16; 

	//sirve para el 3D para darle depth con el fog
	gpu_set_fog(true,c_black,0,1);

	draw_sprite_pos(sprite_index,image_index,
					x - (sprite_width*0.5) - sx, y - sy,
					x + (sprite_width*0.5) - sx, y - sy,
					x + (sprite_width*0.5),     y,
					x - (sprite_width*0.5),     y,
					0.5
					)
	gpu_set_fog(false,c_white,0,0);
}