//shadow
if(EntityShadow) draw_sprite_ext(spr_shadow,0,x,y-1,EntityShadowScale,EntityShadowScale,image_angle,image_blend,image_alpha);


if(flash !=0)
{
	shader_set(flashShader);
	uFlash = shader_get_uniform(flashShader, "flash");
	shader_set_uniform_f(uFlash, flash);
}
	draw_sprite_ext(sprite_index,image_index, floor(x), floor(y-z),image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if(id == global.activate) 
{
	instance_create_depth(x,bbox_top - 10,-999,obj_space_NPC);
	
	if(distance_to_object(o_player) > 20) instance_deactivate_object(obj_space_NPC);
	
}

if(shader_current() != -1) shader_reset();