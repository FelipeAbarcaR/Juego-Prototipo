// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function States(){
	var scr;
switch (state)
	{
		case "jump":
		scr = scr_GridMove;
		break;
	
		case "wait":
		//sprite_index=
		scr = scr_Wait;
		break;
		
		case "move":
		scr = scr_GridMove;
		break;		
	
		case "outoftile":
		scr = scr_Outoftile;
		break;
	
		case "locked":
		scr = scr_Locked;
		break;
		
		case "roll":

		scr = scr_Roll;
		break;
	
	}
script_execute(scr)

}

function scr_GridMove(){
	if(GridSpeed<=DistanceRemaining){
		x+=lengthdir_x(GridSpeed,Direction);
		y+=lengthdir_y(GridSpeed,Direction);
		DistanceRemaining-=GridSpeed;
	} else {
		if(DistanceRemaining=0) state="wait";
		else {
			x+=lengthdir_x(GridSpeed-DistanceRemaining,Direction);
			y+=lengthdir_y(GridSpeed-DistanceRemaining,Direction);
			DistanceRemaining=0;
			state="wait"
		}
	}
	
	z=(sin((DistanceRemaining/GridDistance)*pi))*GridJumpHeight;
	
	//check if z is close to max height, to see where it is going
	var _range =GridJumpHeight/10;
	if(abs(z)>=GridJumpHeight-_range)
	{
	    //check if it is landing on a beattile
		
		var _lay_id	=	layer_get_id("CryptTiles");
		var _tilemap_id = layer_tilemap_get_id(_lay_id);
		var x_to = lengthdir_x(DistanceRemaining,Direction);
		var y_to = lengthdir_y(DistanceRemaining,Direction);
		var _tilemap = tilemap_get_at_pixel(_tilemap_id,x+x_to,y+y_to);
		if(object_index==obj_crypt_player)
		{
			if(_tilemap ==-1 or _tilemap==0)
			{
				Direction+=180;
			    damaged=true;
				DistanceRemaining=point_distance(x,y,x_from,y_from);
			}
		}
	}
}

function scr_Wait()
{
	if(object_index==obj_crypt_player)
	{
		sprite_index=spr_wait;
		if(global.beatchance==true)
		{
			if (inputmagnitude==1){
				Direction=InputDirection;
				DistanceRemaining=GridDistance;
				state = "jump";
				//audio_play_sound(Beep, 9, 0);
				x_from=x;
				y_from=y;
			}   
			
		if(roll_key)
		{
			Direction=LastDirection;
			DistanceRemaining=GridRollDistance;
			state="roll";
			x_from=x;
			y_from=y;
		}
		}
	}
	
}
function scr_Outoftile(){
	
	//comeback to x_from,y_from
	//state move again
	
}
function scr_Locked(){
	
	if(object_index==obj_crypt_player) inputmagnitude=0;
	
}

function scr_Roll()
{
	//animate sprite
	sprite_index=spr_roll;
	var _totalframes = sprite_get_number(sprite_index)/4;
	image_index = (round(LastDirection/90))*_totalframes + min (((1-(DistanceRemaining / GridRollDistance)) *(_totalframes)), _totalframes - 1);
    inputmagnitude=0;
	
	if(GridSpeed<=DistanceRemaining){
		x+=lengthdir_x(GridRollSpeed,Direction);
		y+=lengthdir_y(GridRollSpeed,Direction);
		DistanceRemaining-=GridRollSpeed;
	} else {
		if(DistanceRemaining=0) state="wait";
		else {
			x+=lengthdir_x(GridRollSpeed-DistanceRemaining,Direction);
			y+=lengthdir_y(GridRollSpeed-DistanceRemaining,Direction);
			DistanceRemaining=0;
			state="wait"
		}
	}
	
	z=(sin((DistanceRemaining/GridRollDistance)*pi))*GridRollHeight;
	
	//check if z is close to max height, to see where it is going
	var _range =GridRollHeight/10;
	if(abs(z)>=GridRollHeight-_range)
	{
	    //check if it is landing on a beattile
		
		var _lay_id	=	layer_get_id("CryptTiles");
		var _tilemap_id = layer_tilemap_get_id(_lay_id);
		var x_to = lengthdir_x(DistanceRemaining,Direction);
		var y_to = lengthdir_y(DistanceRemaining,Direction);
		var _tilemap = tilemap_get_at_pixel(_tilemap_id,x+x_to,y+y_to);
		if(object_index==obj_crypt_player)
		{
			if(_tilemap ==-1 or _tilemap==0)
			{
				Direction+=180;
			    damaged=true;
				DistanceRemaining=point_distance(x,y,x_from,y_from);
			}
		}
	}
}