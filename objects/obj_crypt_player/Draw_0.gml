/// @description Insert description here
// You can write your code in this editor

//start red flash shader if get damaged(step event) 
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

//blinking effect if he gets damaged
if(inmunity)
{
	if(time_to_wait==time_showing_sprite)
	{
	    draw_with_z();
	}
	
	if(blinking_delta_time>=time_to_wait)
	{
		blinking_delta_time=0;
		//switch between time showing the sprite or not
	    if(time_to_wait==time_showing_sprite)
		{
			time_to_wait=time_showing_nothing
			
		} else 
		{
		    time_to_wait=time_showing_sprite;
		}
	}
} else draw_with_z();

shader_reset();



if(global.DrawText)
{
	draw_circle(x,y,2,0);
	
	var _x1,_x2,_x3,_x4;
	var _y1,_y2,_y3,_y4;
	_x1 = bbox_left;
	_x2 = bbox_right;
	_x3 = bbox_left;
	_x4 = bbox_right;
	
	_y1 = bbox_top;
	_y2 = bbox_top;
	_y3 = bbox_bottom;
	_y4 = bbox_bottom;
	
    draw_line(_x1,_y1,_x2,_y2);
	draw_line(_x1,_y1,_x3,_y3);
	draw_line(_x3,_y3,_x4,_y4);
	draw_line(_x2,_y2,_x4,_y4);
}