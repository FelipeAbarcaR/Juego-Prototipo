/// @description Insert description here
// You can write your code in this editor

trap_list=ds_list_create();
trap_num = collision_rectangle_list(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_crypt_prnt_trap,false,false,trap_list,false)
crypt_room_statue= collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_statua,0,1);
crypt_room_gate= collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,o_solid_bridge,0,1);
crypt_room_item= collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_item,0,1);
global.cryptroom=id;
