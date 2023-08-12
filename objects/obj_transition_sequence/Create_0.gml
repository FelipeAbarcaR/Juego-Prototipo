/// @description Insert description here
// You can write your code in this editor

time_transition_in =  0.5;
transition_ended=false;
transition_out_ended=false;
room_target			= global.targetRoom;
transition_type_out = global.transition_out_type;
transition_type_in	= global.transition_in_type;

out_transition_id  = -1;
draw_background_patch=false;

TransitionBegin(room_target,transition_type_out);