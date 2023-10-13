//shadow
if(EntityShadow) draw_sprite_ext(spr_shadow,0,x,y-1,EntityShadowScale,EntityShadowScale,image_angle,image_blend,image_alpha);


if(flash !=0)
{
	shader_set(flashShader);
	uFlash = shader_get_uniform(flashShader, "flash");
	shader_set_uniform_f(uFlash, flash);
}
	draw_sprite_ext(sprite_index,image_index, floor(x), floor(y-z),image_xscale, image_yscale, image_angle, image_blend, image_alpha);

//if(id == global.activate && EntitySpaceBarActive) 
//{
//	if(distance_to_object(o_player) < 20)
//	{
//	    instance_activate_object(space_bar);
//	}else instance_deactivate_object(space_bar)
//}

if(shader_current() != -1) shader_reset();

if(global.DrawText) draw_sprite_bbox();