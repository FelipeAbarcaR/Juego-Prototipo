// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function States(){
	var scr;
switch (state)
	{
		case "jump":
		scr = scr_GridMove;
		Crypt_jump_animate();
		break;
	
		case "wait":
		scr = scr_Wait;
		if(object_index==obj_crypt_player) image_index=(InputDirection/45);
		break;
		
		case "move":
		scr = scr_GridMove;
		break;		
	
		case "outoftile":
		scr = scr_Outoftile;
		break;
	
		case "locked":
		scr = scr_Locked;
		if(object_index==obj_crypt_player) image_index=(InputDirection/45);
		break;
		
		case "roll":
		scr = scr_Roll;
		break;
		
		case "slide":
		scr = scr_Slide;
		break;
		
		case "tempo":
		scr = scr_3tempo;
		if(object_index==obj_crypt_player) image_index=(LastDirection/45);
		break;
	
	
	}
script_execute(scr);

}

function scr_GridMove(){
	if(GridSpeed<=DistanceRemaining){
		x+=lengthdir_x(GridSpeed,Direction);
		y+=lengthdir_y(GridSpeed,Direction);
		DistanceRemaining-=GridSpeed;
	} else {
		var _shake=1;
		var _shake_acc=0.5;
		if(global.BeatNumber>=30)
		{
			_shake=5;
			_shake_acc=1.5;
		}
		
		if(DistanceRemaining=0)
		{
			state="wait";
			uc_shake(_shake,_shake_acc);
			x=x-x%GridDistance+GridDistance/2
			y=y-y%GridDistance+(GridDistance/2)+3
		}
		
		else {
			x+=lengthdir_x(GridSpeed-DistanceRemaining,Direction);
			y+=lengthdir_y(GridSpeed-DistanceRemaining,Direction);
			x=x-x%GridDistance+GridDistance/2
			y=y-y%GridDistance+(GridDistance/2)+3
			DistanceRemaining=0;
			state="wait"
			uc_shake(_shake,_shake_acc);
		}
	}
	
	z=(sin((DistanceRemaining/GridDistance)*pi))*GridJumpHeight;
	
	//check if z is close to max height, to see where it is going
	var _range =GridJumpHeight/10;
	if(abs(z)>=GridJumpHeight-_range)
	{
	    //check if it is landing on a beattile
		
		var _lay_id	= -1;
		var _tilemap_id=-1;
		_lay_id= layer_get_id("CryptTiles");
		_tilemap_id = layer_tilemap_get_id(_lay_id);
		var x_to = lengthdir_x(DistanceRemaining,Direction);
		var y_to = lengthdir_y(DistanceRemaining,Direction);
		var _tilemap = tilemap_get_at_pixel(_tilemap_id,x+x_to,y+y_to);
		if(object_index==obj_crypt_player)
		{
			//if the tile to land isn't a beat tile, turn around and get "damaged"
			if(_tilemap ==-1 or _tilemap==0)
			{
				Direction+=180;
			    damaged=true;
				DistanceRemaining=point_distance(x,y,x_from,y_from);
				play_sfx(sound_bump);
			}
			if(instance_exists(obj_crypt_enemy))
			{
			    if(position_meeting(x+x_to,y+y_to,obj_crypt_enemy))
				{
				    Direction+=180;
					play_sfx(sfx_ataque_espada);
					SendFX(spr_fx_fight_atk1222,x+6,y,{creator : id});
				}
			}
		}
	}
}

function scr_Wait()
{
	//check if standing on an ice tile
	
	if(object_index==obj_crypt_player)
	{
		sprite_index=spr_wait;
		if(global.beatchance==true)
		{
			if (inputmagnitude==1){
				Direction=InputDirection;
				DistanceRemaining=GridDistance;
				state = "jump";
				play_sfx(sound_jump,0.6);
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
				play_sfx(sfx_roll);
			}
			if(button_tempo)
			{
				tempo_count=0;//para recordar que acá comienza con 3 
				tempo_beat	=	global.BeatNumber+global.beatprogress;
				tempo_wait=false;
				DistanceRemaining=GridDistance;
				play_sfx(tempo_sound[tempo_count]);
				state = "tempo";
				x_from=x;
				y_from=y;
				spell_call_3tempo();
			}
		}
		
		//Check if landing on ice tile
		var _lay_id	= -1;
		var _tilemap_id=-1;
		_lay_id= layer_get_id("CryptTiles");
		_tilemap_id = layer_tilemap_get_id(_lay_id);

		var _tilemap = tilemap_get_at_pixel(_tilemap_id,x,y);

		if(_tilemap==3)//if the tile landed is a frozen tile
		{
			obj_beat.frozen_beat	=	true;
			
			state	=	"slide";
			
			
			var _direction	=	LastDirection;
			var _distance	=	GridDistance;
			
			_lay_id		=	layer_get_id("CryptTiles");
			_tilemap_id =	layer_tilemap_get_id(_lay_id);
			
			var _x_to	=	lengthdir_x(_distance,_direction);
			var _y_to	=	lengthdir_y(_distance,_direction);
			
			var _tilemap	=	tilemap_get_at_pixel(_tilemap_id,x+_x_to,y+_y_to);
			
			if(_tilemap==-1 || _tilemap==0)// if the line you are going sliding is not a tilemap
			{
			    state	=	"wait";
			}
			
			Direction = _direction;
			DistanceRemaining= _distance;

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

function scr_Slide()
{
    //rotation
	var _rotation=25;
	if(Direction==180) _rotation=_rotation*(-1);
	image_angle=_rotation;
	if(global.beat) sliding=true;
	if(sliding)
	{
		if(GridSpeed<=DistanceRemaining){
		x+=lengthdir_x(GridSpeed,Direction);
		y+=lengthdir_y(GridSpeed,Direction);
		DistanceRemaining-=GridSpeed;
		} else {
			if(DistanceRemaining==0)
			{
				state="wait";
				image_angle=0;
			}
			else {
				x+=lengthdir_x(GridSpeed-DistanceRemaining,Direction);
				y+=lengthdir_y(GridSpeed-DistanceRemaining,Direction);
				DistanceRemaining=0;
				state="wait";
				image_angle=0;
			}
		}
	}
}

function scr_3tempo()
{
    var _beat_progress			= global.BeatNumber+global.beatprogress-tempo_beat;
	var _tempo_progress			= floor(_beat_progress/0.5);
	var _tempo_single_progress	=	_beat_progress % 0.5;
	
	if(!tempo_wait)
	{
	    if(tempo_speed<=DistanceRemaining)
		{
		    x+=lengthdir_x(tempo_speed,Direction);
			y+=lengthdir_y(tempo_speed,Direction);
			DistanceRemaining-=tempo_speed;
			var _inst=instance_create_depth(x,y,depth,obj_vanish);
			_inst.sprite_index=self.sprite_index;
			_inst.image_index=self.image_index
			_inst.vanish=0.04;
		}
		else
		{
		    x+=lengthdir_x(tempo_speed-DistanceRemaining,Direction);
			y+=lengthdir_y(tempo_speed-DistanceRemaining,Direction);
			
			//parche, fix al medio del grid 
			x=x-(x%GridDistance)+(GridDistance/2);
			y=y-(y%GridDistance)+(GridDistance/2)+3;//3 pixel más abajo de la mitad para acomodar al gato
			
			x_from=x;
			y_from=y;
			
			DistanceRemaining=0;
			tempo_wait=true;
		}
	}else
	{

	    if(inputmagnitude==1)
		{
		    Direction=LastDirection;
			//Direction=InputDirection;
			//DistanceRemaining=GridDistance		
		};
		if(_tempo_progress>2)
		{
		    state="wait";
		}
		if(tempo_count != _tempo_progress)
		{
			tempo_count=_tempo_progress;
		    
			if(_beat_progress>=0.3 && _beat_progress<=1.7)
			{
				var _do = function()
				{
				    Direction=LastDirection;
					DistanceRemaining=GridDistance;
					tempo_wait=false;
					/*PARCHE*/ var _tc= min(tempo_count,2)
					play_sfx(tempo_sound[tempo_count]);
							
					var _lay_id	= -1;
					var _tilemap_id=-1;
					_lay_id= layer_get_id("CryptTiles");
					_tilemap_id = layer_tilemap_get_id(_lay_id);
					var x_to = lengthdir_x(DistanceRemaining,Direction);
					var y_to = lengthdir_y(DistanceRemaining,Direction);
					var _tilemap = tilemap_get_at_pixel(_tilemap_id,x+x_to,y+y_to);

					//if the tile to land isn't a beat tile
					if(_tilemap ==-1 or _tilemap==0)
					{
						damaged=true;
						DistanceRemaining=0;
						play_sfx(sound_bump);
						state="wait";
						x=x_from;
						y=y_from;
					}else
					{
						play_sfx(tempo_sound[tempo_count]);
					}
					
				}
			    if(inputmagnitude==1)
				{
					_do()
				}else
				{
				    if(_tempo_progress==1 || _tempo_progress==2)
					{
					   _do();				   
					}
				}
			}
		};
	}
}