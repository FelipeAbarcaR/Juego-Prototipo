//shadow
if(EntityShadow) draw_sprite(spr_shadow,0,x,y-1);

if(flash !=0)
{
	shader_set(flashShader);
	uFlash = shader_get_uniform(flashShader, "flash");
	shader_set_uniform_f(uFlash, flash);
}
	draw_sprite_ext(sprite_index,image_index, floor(x), floor(y-z),image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if(id == global.activate) draw_sprite(spr_testeo_interaction_NPC,0,x,y - 20);

if(shader_current() != -1) shader_reset();