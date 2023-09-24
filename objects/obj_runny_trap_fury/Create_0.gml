/// @description Insert description here
// You can write your code in this editor
event_inherited();
image_blend=c_orange;


y_speed			=	8;
initial_y_speed	=	y_speed;

vanish=0.02;

rotation_speed			=	1;
initial_rotation_speed	=	rotation_speed;
rotation_speed_decrease	=	0.02;


speed_decrease			=	0.35;
initial_speed_decrease	=	speed_decrease;

y_speed_frenzy				=	0.2
frenzy_scale_image_speed	=	0.012;
frenzy_available			=	true;
if(global.runny_activate_frenzy) frenzy_available=false;