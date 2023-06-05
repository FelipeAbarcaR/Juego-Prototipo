/// @description Insert description here
// You can write your code in this editor

Izquierda = (keyboard_check_pressed(vk_left));
Derecha = (keyboard_check_pressed(vk_right));
Arriba = (keyboard_check_pressed(vk_up));
Abajo = (keyboard_check_pressed(vk_down));

InputDirection = point_direction(0,0, Derecha - Izquierda, Abajo-Arriba);
inputmagnitude = (Derecha-Izquierda != 0) xor (Abajo - Arriba != 0);

if (state =="wait" && inputmagnitude==1 && global.beatchance==true){
	Direction=InputDirection;
	DistanceRemaining=GridDistance;
	state = "jump";
	//audio_play_sound(Beep, 9, 0);
}
States();

//animation
if z>0 image_speed=1 else image_speed=0;