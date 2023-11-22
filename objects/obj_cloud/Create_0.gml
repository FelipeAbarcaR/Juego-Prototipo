/// @description Insert description here
// You can write your code in this editor

if(instance_number(object_index) ==1)
{
    for(var i=0;i<12;i++)
	{
		var rand_x =floor(random(room_width));
		var rand_y = floor(random(room_height));
		
	    instance_create_layer(rand_x,rand_y,layer,object_index);
		show_debug_message("instance_created x= "+string(rand_x)+ " y= "+string(rand_y));
	}
}

image_index=round(random(image_number));

image_speed=0;

speed=0.007+random(0.014);

shadow_surface=surface_create(sprite_width,sprite_height);

maxalpha=0.3;