/// @description Insert description here
// You can write your code in this editor

mid_transition_time		=	0.3;
mid_transition			=	false;
transition_ended		=	false;
transition_out_ended	=	false;
ready_to_transition_in	=	false;

room_target			=	global.roomTarget;
transition_type_out =	global.transition_out_type;
transition_type_in	=	global.transition_in_type;
sequence_time		=	global.transition_time/2;


previous_bgm_transition_time	=	obj_beat.bgm_transition_time;

out_transition_id		=	-1;
draw_background_patch	=	false; //para crear un cuadro negro que tape pifias

mid_transition_in	=	false;

//start transition out by playing a sequence
out_transition_id	=	TransitionPlaceSequence(transition_type_out);
