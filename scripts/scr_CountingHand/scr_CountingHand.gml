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
		
		if(room==rm_GD){
			xhand=700;
			yhand=60;
		}
		
	//create counting hand with h
		if keyboard_check_pressed(ord("H")) handcreate(128+xhand,80+yhand);
}

function handcreate(_x,_y)
{
     instance_create_layer(_x, _y, "Instances", obj_CountHand);
}