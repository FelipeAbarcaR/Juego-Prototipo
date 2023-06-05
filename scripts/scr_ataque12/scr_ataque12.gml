function scr_ataque1p2() {
	// ataque 1 parte 2
	global.enemy_atk = 1;
	global.enemy_hit = 0;

	switch(ataque)
	{
		case 1:
		current_path=pth_ADL;
	
		break;
	
		case 2:
			current_path=pth_AM;
		break;
	
		case 3:
			current_path=pth_AUD;
		break;
		
		case 4:
			current_path=pth_AUL;
		break;
	}
point_to_go=0;
xi=x;
yi=y;

}
