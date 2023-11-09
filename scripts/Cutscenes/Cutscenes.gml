function CutSceneWait(_seconds){
/// @desc CutSceneWait
/// @arg seconds
	
	alarm[0]=_seconds*room_speed;
	//timer++;
	//if(timer >= _seconds * room_speed)
	//{
	//	timer = 0;
	//	CutSceneEndAction();
	//}
}
function CutSceneStart()
{
    //POR DEFINIR
}

function CutSceneEndAction (){
	
	scene++;
	if(scene > array_length(scene_info) - 1) 
	{ 
		instance_destroy();
		exit;
	}
}


function CutScenePlaySound(_SoundID,_Priority,_Loops){
	
	audio_play_sound(_SoundID,_Priority,_Loops);
	CutSceneEndAction();
}
function CutSceneChangeMusic(_music)
{
    // code here
}

function CutSceneInstanceCreate(_x,_y,_layerID,_obj){
	
	var inst = instance_create_layer(_x,_y,_layerID,_obj);
	CutSceneEndAction();
	
	return inst;
}

function CutSceneInstanceDestroy(_objID){
	
	with(_objID)
	{
		instance_destroy();
	}
	CutSceneEndAction();
}

function CutSceneInstanceDestroyNearest(_x,_y,_obj){
	
	var inst = instance_nearest(_x,_y,_obj);
	
	CutSceneInstanceDestroy(inst);
}

//la diferencia en obj y objID es eque el con Id es una instancia en espefico 

function CutSceneChangexscale(_objID, _image_xscale){
/// @desc CutSceneChangexscale
/// @arg Obj
/// @arg Image_xscale*
	
	var arg;
	var i = 0;
	
	repeat(argument_count)
	{
		arg[i] = argument[i];
		i++;
	}
	if(argument_count > 1)
	{
		with(_objID) image_xscale = _image_xscale;
	}
	else
	{
		with(_objID) image_xscale = -image_xscale;
	}
	CutSceneEndAction();
}

function CutSceneChangeVariable(_obj,_VarNameasString,_value){
	
								//el id es el id de la instancia a cambiar
	with(_obj) variable_instance_set(id,_VarNameasString,_value);
	
	CutSceneEndAction();
	
}

function CutScenemoveCharacter(_objID,_x,_y,_relative,_spd){
										//Relativo es que si quiero que se mueva a un punto concreto o si quiero que se mueva relativo a su posicion
	
	if(x_dest == -1)
	{
		if(!_relative)
		{
			x_dest = _x;
			y_dest = _y;
		}
		else
		{
			x_dest = _objID.x + _x;
			y_dest = _objID.y + _y;
		}
	}
	
	var _xx = x_dest;
	var _yy = y_dest;
	
	with(_objID)
	{
		sprite_index = spriterun;
		
		if(point_distance(x,y,_xx,_yy) >= 0)
		{
			var dir = point_direction(x,y,_xx,_yy);
			var ldirx = lengthdir_x(_spd,dir);
			var ldiry = lengthdir_y(_spd,dir);
			
			x+= ldirx;
			y+= ldiry;
		}
		else
		{
			sprite_index = spriteidle;
			x = _xx;
			y = _yy;
			
			with(other)
			{
				x_dest = -1;
				y_dest = -1;
				CutSceneEndAction();
			}
				
		}
	}				
}

function CreateCutScene(_sceneinfo){
	
	var inst = instance_create_layer(0,0,"Instances",obj_cutscene);
	with(inst) scene_info = _sceneinfo;
		
}
	