// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_rainbow_shader(){
	shader_set(shdrRainbow)
	var uv = sprite_get_uvs(sprite_index, image_index);
	shader_set_uniform_f(rainbow_uniUV, uv[0], uv[2]);
	shader_set_uniform_f(rainbow_uniSpeed, rainbow_speed);
	shader_set_uniform_f(rainbow_uniTime, rainbow_time);
	shader_set_uniform_f(rainbow_uniSaturation, rainbow_saturation);
	shader_set_uniform_f(rainbow_uniBrightness, rainbow_brightness);
	shader_set_uniform_f(rainbow_uniSection, rainbow_section);
	shader_set_uniform_f(rainbow_uniMix, rainbow_mix);
}