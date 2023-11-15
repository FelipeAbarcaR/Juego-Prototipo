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



//-------------------WEBEO DE CINEMATICAS-------------------------------


cinematica = undefined;

if(file_exists(working_directory + "Cutscenes.json"))
{
	var json = "";
	var file = file_text_open_read(working_directory + "Cutscenes.json");
	
	while(file_text_eof(file) == false)
	{
		json += file_text_readln(file);
	}
	file_text_close(file);
	
	cinematica = json_parse(json);
}

global.cutscenes = {};	
global.cutscene_topics = {};

var _cutscene = "";
var _cutscene_comp = "";
var _action = "";
var _cutscene_topic = "";
var _snap = 0;

// TEXTO
var _speaker = "";
var _sprite = "";
var _text = "";
var _portrait = 0;
var _conciencia = "";
var _text_number = 1;
var _background = 0;
var _npc = noone;

// CAMERA
var _camera_mode = "";
var _obj_follow = "";
var _target_x = 0;
var _target_y = 0;
	
// CAMERA FX
var _fx = "";

// MUSIC and SOUND FX
var _bgm = "";
var _sound_fx = "";

// Gesto
var _gesture = 0;
var _obj_gesture = "";

// WAIT
var _seconds = 0;




for (var _i = 0; _i < array_length(cinematica); _i++)
{
	_cutscene = cinematica[_i][$ "CS_NAME"];
	
	if(_i == 18)
	{
		hola = 10;
	}
	
	if(!struct_exists(global.cutscenes,_cutscene) and _cutscene != "")
	{
		global.cutscenes[$ _cutscene]= [];
		array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[CutSceneStart,[],true]);
	}
	else
	{
		_action = cinematica[_i][$ "ACTION"];
		_snap = real(cinematica[_i][$ "SNAP"]);
		
		switch(_action)
		{
			case "TEXT":
			
				_npc = asset_get_index(cinematica[_i][$ "ARG1"]);
				_speaker = cinematica[_i][$ "ARG2"];
				_text = cinematica[_i][$ "ARG3"];
				_portrait = real(cinematica[_i][$ "ARG4"]);
				_sprite = asset_get_index(cinematica[_i][$ "ARG5"]);
				_conciencia = cinematica[_i][$ "ARG6"];
				_background = real(cinematica[_i][$ "ARG7"]);
				
				if(_cutscene_comp != _cutscene) _text_number = 0;
				
				if(!struct_exists(global.cutscene_topics,_cutscene_topic) /*and _cutscene_topic != ""*/)
				{
					_cutscene_topic = _cutscene + " TEXT" + string(_text_number);
					global.cutscene_topics[$ _cutscene_topic] = [];
					
					//if(_npc != -1) array_insert(global.cutscenes_topics[$ _cutscene_topic],array_length(global.cutscenes_topics[$ _cutscene_topic]),SETNPC(_npc));
					array_insert(global.cutscene_topics[$ _cutscene_topic],array_length(global.cutscene_topics[$ _cutscene_topic]),BACKGROUND(_background));
					array_insert(global.cutscene_topics[$ _cutscene_topic],array_length(global.cutscene_topics[$ _cutscene_topic]),SPEAKER(_speaker,_sprite,_portrait));
					array_insert(global.cutscene_topics[$ _cutscene_topic],array_length(global.cutscene_topics[$ _cutscene_topic]),TEXT(_text));	
					
					if(_conciencia == "1")
					{
						array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[startDialogueConciencia,[_cutscene_topic],_snap]);
					}
					else
					{
						array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[startDialogue,[_cutscene_topic],_snap]);
					}
					_cutscene_topic = "";
					_cutscene_comp = _cutscene;
					_text_number++;
				}
				else
				{
					continue;
				}	
			break;
			
			case "CAMERA":
				
				_camera_mode = cinematica[_i][$ "ARG1"];
				
				if(_camera_mode == "1")
				{
					_obj_follow = asset_get_index(cinematica[_i][$ "ARG2"]);
					
					if(_obj_follow != -1)
					{
						array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[uc_set_mode,[CMODE.OBJECT_FOLLOWING],_snap]);
						array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[uc_set_instance_following_list,[_obj_follow],_snap]);
					}
					
				}
				else if(_camera_mode == "0")
				{
					_target_x = real(cinematica[_i][$ "ARG2"]);
					_target_y = real(cinematica[_i][$ "ARG3"]);
					
					array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[uc_set_mode,[CMODE.STATIC],_snap]);
					array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[uc_set_target_position,[_target_x,_target_y],_snap]);
				}
			
			break;
			
			case "CAMERAFX":
				
				_fx = cinematica[_i][$ "ARG1"];
				
				
				if(_fx == "SCREENSHAKE")
				{
					array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[uc_shake,[],_snap]);
				}
				else if (_fx == "FLASH")
				{
					array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[uc_flash,[],_snap]);
				}
			
			break;
			
			case "MUSIC":
			
				_bgm = asset_get_index(cinematica[_i][$ "ARG1"]);
				
				if(_bgm != -1) array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[CutSceneChangeMusic,[_bgm],_snap]);
				
			break;
			
			case "SOUNDFX":
				
				_sound_fx = asset_get_index(cinematica[_i][$ "ARG1"]);
				
				if(_sound_fx != -1) array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[play_sfx,[_sound_fx],_snap]);
			
			break;
			
			case "ANIMATE":
			
			// todavia no
			
			break;
			
			case "GESTURE":
			
				_gesture = real(cinematica[_i][$ "ARG2"]);
				_obj_gesture = asset_get_index(cinematica[_i][$ "ARG1"]);
			
				if(_obj_gesture != -1) array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[set_gesture,[_obj_gesture,_gesture],_snap]);
			
			break;
			
			case "WAIT":
				
				_seconds = real(cinematica[_i][$ "ARG1"]);
				array_insert(global.cutscenes[$ _cutscene],array_length(global.cutscenes[$ _cutscene]),[CutSceneWait,[_seconds],_snap]);
				
			break;
			
		}	
	}
	
}