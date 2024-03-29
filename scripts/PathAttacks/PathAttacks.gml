	randomize();

//fight path attacks
enum paths {
	DownLeft,
	Middle,
	UpDown,
	UpLeft
}

function scr_ataque1() {
	global.enemy_hit=false;
	
	ataque = choose(0,1,2,3);
	
	switch (ataque)
	{
		case 0:
		wait_to_prepare(2);
		current_path=pth_DL1;
		break;
	
		case 1:
		wait_to_prepare(2);
		current_path=pth_M1;
		break;
	
		case 2:
		current_path=pth_UD1;
		break;
	
		case 3:
		wait_to_prepare(2);
		current_path=pth_UL1;
		break;
	}
	point_to_go=0;
}


function scr_ataque1p2() {
	// ataque 1 parte 2
	global.enemy_atk = 1;
	global.enemy_hit = 0;

	switch(ataque)
	{
		case 0:
		current_path=pth_ADL;
	
		break;
	
		case 1:
			current_path=pth_AM;
		break;
	
		case 2:
			current_path=pth_AUD;
		break;
		
		case 3:
			current_path=pth_AUL;
		break;
	}
point_to_go=0;
xi=x;
yi=y;

}

function ShowFXArrows(){
	var _char = obj_Conde;
	var _x = _char.xstart;
	var _y = _char.ystart;
	var _dodge = _char.dodge_distance*0.6;
	var _scale=1.5;
	
	switch(ataque)
	{
		case 0://DownLeft
			SendFX(spr_arrow_up_right,_x-_dodge,_y+_dodge,{image_xscale : _scale,image_yscale : -1*_scale, image_blend : c_red})
		break;
		
		case 1://Middle
			SendFX(spr_arrow_left,_x-_dodge,_y,{image_xscale : _scale,image_yscale : _scale, image_blend : c_red});
		break;
		
		case 2: //UpDown
			SendFX(spr_arrow_up,_x,_y+_dodge,{image_xscale : _scale,image_yscale : -1*_scale, image_blend : c_red})
			SendFX(spr_arrow_up,_x,_y-_dodge,{image_xscale : _scale,image_yscale : _scale, image_blend : c_red})
		break;
		
		case 3: //UpLeft
			SendFX(spr_arrow_up_right,_x-_dodge,_y-_dodge,{image_xscale : _scale,image_yscale : _scale, image_blend : c_red});
		break;
	
		default: break;

	}
}

function wait_to_prepare(_beats)
{
    prepare_wait_beats=_beats;
}