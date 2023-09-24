/// @description Insert description here
// You can write your code in this editor

Izquierda = (keyboard_check_pressed(vk_left));
Derecha = (keyboard_check_pressed(vk_right));
Arriba = (keyboard_check_pressed(vk_up));
Abajo = (keyboard_check_pressed(vk_down));

roll_key = (keyboard_check_pressed(vk_space));

InputDirection = point_direction(0,0, Derecha - Izquierda, Abajo-Arriba);
inputmagnitude = (Derecha-Izquierda != 0) xor (Abajo - Arriba != 0);

key_direction_pressed=(Izquierda+Derecha+Arriba+Abajo!=0);

if(key_direction_pressed)
{
    InputDirection = point_direction(0,0, Derecha - Izquierda, Abajo-Arriba);
	LastDirection=InputDirection;
	draw_vanish_beatbar();
	
}else InputDirection=LastDirection;
image_index=(InputDirection/45);
States();


if(inmunity)
{
    blinking_delta_time+=delta_time/1000000;
}
if(damaged)
{
	damaged=false;
    start_flash=true;
}
//animation
//if z>0 image_speed=1 else image_speed=0;


