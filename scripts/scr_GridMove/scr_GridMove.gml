// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_GridMove(){
	if(GridSpeed<=DistanceRemaining){
		x+=lengthdir_x(GridSpeed,Direction)
		y+=lengthdir_y(GridSpeed,Direction)
		DistanceRemaining-=GridSpeed	
	} else {
		if(DistanceRemaining=0) state="wait";
		else {
			x+=lengthdir_x(GridSpeed-DistanceRemaining,Direction)
			y+=lengthdir_y(GridSpeed-DistanceRemaining,Direction)
			DistanceRemaining=0;
			state="wait"
		}


	}
z=(sin((DistanceRemaining/GridDistance)*pi))*GridJumpHeight
}
