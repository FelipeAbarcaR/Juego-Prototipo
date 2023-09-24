/// @description Insert description here
// You can write your code in this editor
event_inherited();

y_speed	=	3;

vanish	=	.02;

rotation_speed			=	1;
initial_rotation_speed	=	rotation_speed;
rotation_speed_decrease	=	0.02;

y_speed_frenzy	=	y_speed*2;

//rainbow shader
// Create Event
shdrRainbow=sha_rainbow;

rainbow_uniUV         = shader_get_uniform(shdrRainbow, "u_uv");
rainbow_uniTime       = shader_get_uniform(shdrRainbow, "u_time");
rainbow_uniSpeed      = shader_get_uniform(shdrRainbow, "u_speed");
rainbow_uniSection    = shader_get_uniform(shdrRainbow, "u_section");
rainbow_uniSaturation = shader_get_uniform(shdrRainbow, "u_saturation"); 
rainbow_uniBrightness = shader_get_uniform(shdrRainbow, "u_brightness");
rainbow_uniMix        = shader_get_uniform(shdrRainbow, "u_mix");

rainbow_time  = 0;
rainbow_speed = 1.0;
rainbow_section = 0.5;
rainbow_saturation = 0.7;
rainbow_brightness = 0.8;
rainbow_mix = 0.5; 