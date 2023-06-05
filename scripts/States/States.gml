// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function States(){
	var scr
switch (state)
	{
		case "jump":
		scr = scr_GridMove;
		break;
	
		case "wait":
		scr = scr_Wait;
		break;
		
		case "move":
		scr = scr_GridMove;
		break;		
	
		//case "hurt":
		//scr = scr_Hurt;
		//break;
		
		//case "hit":
		//scr = scr_Hit;
		//break;
	
	}
script_execute(scr)

}
