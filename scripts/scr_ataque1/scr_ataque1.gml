function scr_ataque1() {
	global.enemy_hit=false;
	randomize();
	ataque = choose(1,2,3,4);
	switch (ataque)
	{
		case 1:
		current_path=pth_DL1;
		break;
	
		case 2:
		current_path=pth_M1;
		break;
	
		case 3:
		current_path=pth_UD1;
		break;
	
		case 4:
		current_path=pth_UL1;
		break;
	}
	point_to_go=0;
}