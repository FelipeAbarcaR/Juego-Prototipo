global.cutscene=false;

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
	return id;
}
function CutSceneStart()
{
    show_debug_message("Cutscene started");
	global.cutscene=true;
	uc_bars(true,0.07,0.1);
	CutSceneWait(0.3);	
	
}
function CutSceneEnd()
{
    show_debug_message("Cutscene ended");
	uc_bars(false);
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
	var _obj=_objID;
	_obj.automoving				=	true;
	_obj.x_dest					=	_x;
	_obj.y_dest					=	_y;
	_obj.dest_relative			=	_relative;
	_obj.automove_spd			=	_spd;
	
	var _id = instance_nearest(_x,_y,_objID);
	return _id;
}

function CreateCutScene(_sceneinfo){
	
	var inst = instance_create_layer(0,0,"Instances",obj_cutscene);
	with(inst) scene_info = _sceneinfo;
		
}
	