/// @description Insert description here
// You can write your code in this editor

//red flash shader
if(start_flash)
{
	x1+=0.1
    current_flash=max(sin(x1)*flash,0);
	if (current_flash<=0)
	{
		start_flash=false;
		x1=0;
		current_flash=0;
	}else{
		shader_set(sha_red_flash);
		shader_set_uniform_f(sh_fhlash,current_flash);
	}
	
}

draw_self();

if (global.DrawText){
	draw_text(x-16,y+16,string(x_to))
	draw_text(x-16,y+32,string(y_to))
	draw_text(x-16,y+32+16,string(global.beatchance));
	draw_text(x-16,y+64,string(state));
	draw_text(x-16,y+64+16,string(Izquierda+Arriba+Abajo))
	draw_text(x-16,y+64+32,string(sprite_get_speed(sprite_index)));
	draw_text(xstart-16,ystart+64+32+16,"hola: "+string(hola));
}
if(shader_current() != -1) shader_reset();