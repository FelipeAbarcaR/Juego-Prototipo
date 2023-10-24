// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewEncounter(_enemy,_bg){
	
	global.fightEnemy=_enemy;
	global.fightBackground=_bg;
	instance_create_depth(
		uc_get_view_x(),
		uc_get_view_y(),
		-999,
		obj_fight_control
	);
}
 