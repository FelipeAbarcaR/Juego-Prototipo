/// @description Insert description here
// You can write your code in this editor

if(target_x+target_y!=0 && image_angle!=0)
{
	var _len =point_distance(x,y,target_x,target_y);
	var _y_scale=_len/(sprite_get_height(sprite_index));
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,_y_scale,image_angle,c_white,image_alpha);
}


//draw_circle_color(x,y,2,c_white,c_white,false);
//draw_circle_color(target_x,target_y,2,c_red,c_red,false)

//var _text;
//switch(state)
//{
//    case 0:
//	_text = "charging";
//	break;
	
//    case 1:
//	_text = "waiting";
//	break;
	
//    case 2:
//	_text = "firing";
//	break;
	
//    case 3:
//	_text = "desapearing";
//	break;
	
//}

//var _x=lengthdir_x(_len/2,point_direction(x,y,target_x,target_y));
//var _y=lengthdir_y(_len/2,point_direction(x,y,target_x,target_y));


//draw_text(x+_x,y+_y,_text)




