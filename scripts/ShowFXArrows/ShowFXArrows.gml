// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ShowFXArrows(){
	var _char = obj_Conde;
	var _x = _char.x;
	var _y = _char.y;
	var _dodge = _char.dodge_distance;
switch(ataque)
{
	case paths.DownLeft:
		SendFX(spr_arrow2,_x-_dodge,_y+_dodge,{image_xscale : -1})
	break;
	case paths.Middle:
		SendFX(spr_arrow1,_x-_dodge,_y);
	break;
	case paths.UpDown:
		SendFX(spr_arrow3,_x,_y+_dodge,{image_yscale : -1})
		SendFX(spr_arrow3,_x,_y-_dodge)
	break;
	case paths.UpLeft:
		SendFX(spr_arrow1,_x-_dodge,_y-_dodge);
	break;
	

}


}