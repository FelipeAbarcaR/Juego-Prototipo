/// @description Insert description here
// You can write your code in this editor

//SHADERS
var _color=c_white;

//show path points
if(global.DrawText && current_move!=-1 &&current_point>0)
{
	for(var i=0;i<array_length(moves[current_move]);i++)
	{
		var _x=corner_x+moves[current_move][i][2];
		var _y=corner_y+moves[current_move][i][3];
		if (moves[current_move][i][1]==1) draw_set_color(c_blue);
		if (moves[current_move][i][1]==2) draw_set_color(c_red);
	    draw_circle(_x,_y,3,false);
		draw_set_color(c_white);
	}
}

if(path_exists(fight_attack_path)) draw_path(fight_attack_path,x,y,true);
//states
switch(state)
{
    case fight_state.wait:
		if(!status_hurt)
		{
			sprite_index=fight_sprite_wait;
			image_speed =0;
			if(global.beat) image_index++;
		} else
		{
			sprite_index=fight_sprite_hurt;
			image_index=1;
			image_speed=0;
		}
				
	break;
	
	case fight_state.prepare:
		image_speed =0;
		var _count =fight_count_moves(1);
		sprite_index=fight_prepare_sprites[current_move];
		if(x!=xstart) image_index	=	current_point;
		
		_color=#6187d8;
		shader_set(sha_white_outline);	
		var _texture = sprite_get_texture(sprite_index,image_index);
		var _texture_width = texture_get_texel_width(_texture);
	    var _texture_height = texture_get_texel_height(_texture);
		shader_set_uniform_f(sh_texture,_texture_width,_texture_height);
		
	break;
	
	case fight_state.attacking:
		image_speed=1;
		sprite_index=fight_attack_sprites[current_move];
		if(image_index>=image_number-1) image_speed=0;
		
		_color=#cb7c52;
	    shader_set(sha_red_outline);	
		var _texture = sprite_get_texture(sprite_index,image_index);
		var _texture_width = texture_get_texel_width(_texture);
	    var _texture_height = texture_get_texel_height(_texture);
		shader_set_uniform_f(sh_texture,_texture_width,_texture_height);
		
	break;
	
	case fight_state.stun:
	break;
	
	case fight_state.locked:
	break;
	
}

//RED FLASH SHADER IF GOT HIT
if(start_flash1)
{
	x1+=0.1
    current_flash=max(sin(x1)*flash,0);
	if (current_flash<=0)
	{
		start_flash1=false;
		x1=0;
		current_flash=0;
	}else{
		shader_set(sha_red_flash);
		shader_set_uniform_f(sh_fhlash,current_flash);
	}
}

//draw

draw_self();
shader_set(sha_gray);	
var _texture = sprite_get_texture(sprite_index,image_index);
var _texture_width = texture_get_texel_width(_texture);
var _texture_height = texture_get_texel_height(_texture);
shader_set_uniform_f(sh_texture2,_texture_width,_texture_height);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
shader_reset();