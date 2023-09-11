/// @description Insert description here
// You can write your code in this editor
if(got_hit)
{
	x1+=0.1
    current_flash=max(sin(x1)*flash,0);
	if (current_flash<=0)
	{
		got_hit=false;
		x1=0;
		current_flash=0;
	}else{
		shader_set(sha_red_flash);
		shader_set_uniform_f(sh_fhlash,current_flash);
	}
}

draw_self();
if(shader_current() != -1) shader_reset();

if(global.DrawText)
{
	draw_sprite_bbox();
    draw_text_transformed(x-40,y-20,"hola: "+string(hola),0.4,0.4,0);
	draw_circle(x,y,2,0);

}

