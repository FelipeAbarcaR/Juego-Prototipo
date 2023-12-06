draw_sprite(perro_100,0,0,0);
	
if(!surface_exists(surf))
{
	// code here
	var _w=sprite_get_width(perro_100);
	var _h=sprite_get_height(perro_100);
	surf=surface_create(_w,_h);
}
	
surface_set_target(surf);

draw_sprite(reflector_100,0,0,0);
gpu_set_colorwriteenable(1,1,1,0);
false_x+=5;
if(false_x>room_width+400) false_x =-100;
draw_sprite(overlay,0,false_x,y-30);

gpu_set_colorwriteenable(1,1,1,1);	
surface_reset_target();
draw_surface(surf,0,0);
draw_sprite(patas_100,0,0,0);
//draw_sprite(overlay,0,false_x,y);
