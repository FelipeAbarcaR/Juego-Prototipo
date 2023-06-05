// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function scr_CountingHand(){
//COUNTING HAND
	var xhand=0;
	var yhand=0;
	//hand add position if map is pelea
		if(room==rm_pelea){
			xhand=480;
			yhand=110;
		}
	//create counting hand with h
		if keyboard_check_pressed(ord("H")) instance_create_layer(128+xhand, 80+yhand, "Instances", obj_CountHand);
}