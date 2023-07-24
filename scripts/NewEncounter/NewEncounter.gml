// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewEncounter(_enemy,_bg){
	
	var _cam=oCameraManager.camera;
	global.fightEnemy=_enemy;
	global.fightBackground=_bg;
	instance_create_depth(
		camera_get_view_x(_cam),
		camera_get_view_y(_cam),
		-999,
		obj_fight_control
	);

}