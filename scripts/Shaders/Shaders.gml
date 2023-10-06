// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shader_set_rainbow(){
	//SET SHADERS PARAMETERS
	var _shader=  sha_rainbow;

	rainbow_uniUV         = shader_get_uniform(_shader, "u_uv");
	rainbow_uniTime       = shader_get_uniform(_shader, "u_time");
	rainbow_uniSpeed      = shader_get_uniform(_shader, "u_speed");
	rainbow_uniSection    = shader_get_uniform(_shader, "u_section");
	rainbow_uniSaturation = shader_get_uniform(_shader, "u_saturation"); 
	rainbow_uniBrightness = shader_get_uniform(_shader, "u_brightness");
	rainbow_uniMix        = shader_get_uniform(_shader, "u_mix");

	rainbow_time		=	0.0;
	rainbow_speed		=	1.0;
	rainbow_section		=	0.5;
	rainbow_saturation	=	0.2;
	rainbow_brightness	=	0.7;
	rainbow_mix			=	0.6;
	
	return _shader;

}