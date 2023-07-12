
//-----------------TYPING----------------//

// The one function that you need to call!
// Creates a textbox and starts a conversation.
// @param topic - What topic the dialogue box should use

//dialogue system functions
#macro NEWROOM new RoomAction
#macro TEXT new TextAction
#macro SPEAKER new SpeakerAction
#macro CHOICE new ChoiceAction
#macro OPTION new OptionAction
#macro GOTO new GotoAction
#macro FIGHT new FightAction


function startDialogue(topic) {
	if (instance_exists(obj_textbox)) return;
	
	var inst = instance_create_depth(x, y, -999, obj_textbox);
	inst.dialogue_sounds=activate.dialogue_sounds;
	inst.setTopic(topic);

}
function DialogueSound(){

	if (dialogue_sounds != -1 && array_length(dialogue_sounds)>0){

		if(current_tb_sound == -1)
		{
		    ChooseSound();
			audio_play_sound(current_tb_sound,10,0);
			show_debug_message("played from nonsound");
		}else
		{
		    var _audio_playing=audio_is_playing(current_tb_sound)
			if(!_audio_playing)
			{
			    ChooseSound();
				audio_play_sound(current_tb_sound,10,0);
				show_debug_message("played from sound ended");
			}
		}
	}


}
function ChooseSound()
{
	var _sounds_number=array_length(dialogue_sounds)-1
    sound_index=irandom(_sounds_number);
	current_tb_sound=dialogue_sounds[sound_index];
	show_debug_message("ChooseSound() sfx choosed")
}
function type(x, y, text, progress, width) {
	var draw_x = 0;
	var draw_y = 0;
	
	for (var i = 1; i <= progress; i++) {
		var char = string_char_at(text, i);
		// Handle normal line breaks
		if (char == "\n") {
			draw_x = 0;
			draw_y += string_height("A");
		}
		
		// If we're starting a new word, we can line break
		else if (char == " ") {
			draw_x += string_width(char);
			var word_width = 0;
			for (var ii = i + 1; ii <= string_length(text); ii++) {
				var word_char = string_char_at(text, ii);
				
				// If we reached the end of the word, stop checking
				if (word_char == "\n" || word_char == " ")
					break;
				
				// If the current word extends past the width boundary,
				// then move it to the next line
				word_width += string_width(word_char);
				if (draw_x + word_width > width) {
					draw_x = 0;
					draw_y += string_height("A");
					break;
				}
			}
		}
		else {
			// Draw the letter

			draw_text(x + draw_x, y + draw_y, char);

			//draw_text(x + draw_x+2, y + draw_y+2, char);
			draw_x += string_width(char);
		}
	}
}

//-----------------ACTIONS------------------//



		// el constructor hace que pueda llamar a la funcion para hacer una estructura de datos
function DialogueAction() constructor {
	act = function() { };
}

// Define new text to type out
			// el : significa que hereda de la funcion DialogueAction
function TextAction(_text) : DialogueAction() constructor {
	text = _text;

	act = function(textbox) {
		textbox.setText(text);
	}
}

//Set the speaker its portrait and side the portrait is on 
function SpeakerAction (_name,_sprite = undefined,_side = undefined) : DialogueAction() constructor{
	
	name = _name;
	sprite = _sprite;
	side = _side;
	
	act = function(textbox){
		textbox.speaker_name = name;
		
		if(!is_undefined(sprite)) textbox.portrait_sprite = sprite;
		
		if(!is_undefined(side)) textbox.portrait_side = side;
		
		textbox.next ();
	}
		
}
function RoomAction(_roomname) : DialogueAction() constructor{
	changeroom = _roomname;
	act = function(textbox){
	textbox.new_room = changeroom;
	textbox.next();
	}
		
}

function FightAction(_background,_enemy) : DialogueAction() constructor{
	enemy = _enemy;
	background = _background;
	act = function(textbox){

	textbox.fight_bg=background;
	textbox.fight_enemy=enemy;
	textbox.next();
	}
}

function ChoiceAction(_text) : DialogueAction() constructor{
	
	text = _text;
	//Fill this array with all the arguments after the first one
	options = [];
	for(var i = 1; i < argument_count; i++) array_push(options, argument[i]);
	
	act = function(textbox)
	{
		textbox.setText(text);
		textbox.options = options;
		textbox.option_count = array_length(options);
		textbox.current_option = 0;
	}
		
	
}

function OptionAction(_text,_topic) : DialogueAction() constructor{
	 text = _text;
	 topic = _topic;
	 
	 act = function(textbox)
	 {
		 textbox.setTopic(topic);
	 }
}

function GotoAction(_topic) : DialogueAction() constructor{
	
	topic = _topic;
	
	act = function(textbox)
	{
		textbox.setTopic(topic);
	}
	
}

//----------------TOPICS---------------------//

//Importando El JSON del dialogo
dialogo = undefined;

if(file_exists(working_directory + "prueba_dialogo1.json"))
{
	var json = "";
	var file = file_text_open_read(working_directory + "prueba_dialogo1.json");
	
	while(file_text_eof(file) == false)
	{
		json += file_text_readln(file);
	}
	file_text_close(file);
	
	dialogo = json_parse(json);
}


global.topics = {};


hola = 10;

var _portrait = 0;
var _iter = 2;

var _topico = "";
var _topico_comp = "";
var _textbox = "";

var _speaker = "";
var _speakercomp = "";
var _sprite = "";
var _sprite_portrait = "";

var _option = "";
var _option1 = "";
var _option2 = "";
var _option3 = "";
var _option4 = "";
var _num_options = "";
var _option_create = false;

//guardando la data en global.topics

for (var _i = 0; _i < array_length(dialogo); _i++)
{
	_topico = dialogo[_i][$ "conversation_name"];

	if(!struct_exists(global.topics,_topico) and _topico != "")
	{
		global.topics[$ _topico]= [];
		_textbox = dialogo[_i][$ "TEXTBOX"];
		_speaker = dialogo[_i][$ "SPEAKER"];
		_sprite = dialogo[_i][$ "SPRITE"];
		_option = dialogo[_i][$ "TIENE_OPCIONES"];
		_speakercomp = _speaker;
		_iter = 2;
		if(_speaker != "")
		{
			switch(_speaker) // esto es para obtener el sprite correcto
			{
				default:
					_sprite_portrait = spr_ViejoSabio;
				case "Viejo Sabio": 
					_sprite_portrait = spr_ViejoSabio;
				break;
				case "Pedro":
					_sprite_portrait = spr_pt_rana;
				break;
			}
			global.topics[$ _topico][0] = SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.LEFT);
			_portrait += 1;
		}
		//else continue; //esto va a cambiar para los carteles
		if(_option != "0")
		{
			_num_options = dialogo[_i][$ "NUMERO_OPCIONES"];
			switch(_num_options)
			{
				case "2":
					_option1 = dialogo[_i][$ "OPCION1"];
					_option2 = dialogo[_i][$ "OPCION2"];
					if(_option1 != "" and _option2 != "") 
					{
						global.topics[$ _topico][1] = CHOICE(_textbox,OPTION(_option1,"Chose "+_option1),OPTION (_option2, "Chose "+_option2));
						global.topics[$ "Chose "+_option1] = [];
						global.topics[$ "Chose "+_option2] = [];
						_option_create = true;
						_topico_comp = dialogo[_i+1][$ "conversation_response"];
						_iter = 0;
						
					}
				break;	
				case "3":
					_option1 = dialogo[_i][$ "OPCION1"];
					_option2 = dialogo[_i][$ "OPCION2"];
					_option3 = dialogo[_i][$ "OPCION3"];
					if(_option1 != "" and _option2 != "" and _option3 != "") 
					{
						global.topics[$ _topico][1] = CHOICE(_textbox,OPTION(_option1,"Chose "+_option1),OPTION (_option2, "Chose "+_option2),OPTION (_option3, "Chose "+_option3));
						global.topics[$ "Chose "+_option1] = [];
						global.topics[$ "Chose "+_option2] = [];
						global.topics[$ "Chose "+_option3] = [];
						_option_create = true;
						_topico_comp = dialogo[_i+1][$ "conversation_response"];
						_iter = 0;
					}
				break;	
				case "4":
					_option1 = dialogo[_i][$ "OPCION1"];
					_option2 = dialogo[_i][$ "OPCION2"];
					_option3 = dialogo[_i][$ "OPCION3"];
					_option4 = dialogo[_i][$ "OPCION4"];
					if(_option1 != "" and _option2 != "" and _option3 != "" and _option4 != "") 
					{
						global.topics[$ _topico][1] = CHOICE(_textbox,OPTION(_option1,"Chose "+_option1),OPTION (_option2, "Chose "+_option2),,OPTION (_option3, "Chose "+_option3),,OPTION (_option4, "Chose "+_option4));
						global.topics[$ "Chose "+_option1] = [];
						global.topics[$ "Chose "+_option2] = [];
						global.topics[$ "Chose "+_option3] = [];
						global.topics[$ "Chose "+_option4] = [];
						_option_create = true;	
						_topico_comp = dialogo[_i+1][$ "conversation_response"];
						_iter = 0;	
					}
				break;	
			}
			_speaker = dialogo[_i+1][$ "SPEAKER"];
			if(_speaker != "")
			{
				switch(_speaker)
				{
					case "Viejo Sabio": 
						_sprite_portrait = spr_ViejoSabio;
					break;
					case "Pedro":
						_sprite_portrait = spr_pt_rana;
					break;
				}
				if(_portrait == 0) 
				{
					global.topics[$ "Chose "+_option1][0] = SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.RIGHT); 
					_portrait += 1;
				}
				else // _portrait >= 1
				{
					global.topics[$ "Chose "+_option1][0] = SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.LEFT);
					_portrait = 0;
				}
				_speakercomp = _speaker;
				_iter += 1;
			}
			
		}
		else // _option == 0
		{
			if(_textbox != "")
			{
				global.topics[$ _topico][1] = TEXT(_textbox);
			}
			else continue;
		}
	}
	// SI YA EXISTE EL TOPICS EN LA GLOBAL
	else 
	{
		if(_option_create) 
		{
			_topico = dialogo[_i][$ "conversation_response"];
			
			if(_topico == "0") 
			{
				_topico = dialogo[_i][$ "conversation_name"];
				_option_create = false;
			}
			else // _topico != 0
			{
				if(_topico != _topico_comp and _topico != _option1) 
				{
					_iter = 0;
					_speaker = dialogo[_i][$ "SPEAKER"];
					if(_speaker != "")
					{
						switch(_speaker)
						{
							case "Viejo Sabio": 
								_sprite_portrait = spr_ViejoSabio;
							break;
							case "Pedro":
								_sprite_portrait = spr_pt_rana;
							break;
						}
					
						if(_portrait == 0) 
						{
							global.topics[$ _topico][0] = SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.RIGHT); //esto debe cambiar para hacer mas top
							_portrait += 1;
						}
						else // _portrait >= 1
						{
							global.topics[$ _topico][0] = SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.LEFT);
							_portrait = 0;
						}
						_speakercomp = _speaker;
						_iter += 1;
					}
				}
			}
			_topico_comp = _topico;
		}
		_speaker = dialogo[_i][$ "SPEAKER"];
		if(_speaker != _speakercomp and _speaker != "")
		{
			switch(_speaker)
			{
				case "Viejo Sabio": 
					_sprite_portrait = spr_ViejoSabio;
				break;
				case "Pedro":
					_sprite_portrait = spr_pt_rana;
				break;
			}
			if(_portrait == 0) 
			{
				global.topics[$ _topico][_iter] = SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.LEFT);
				_portrait += 1;
			}
			else // _portrait >= 1
			{
				global.topics[$ _topico][_iter] = SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.RIGHT);
				_portrait = 0;
			}
			_speakercomp = _speaker;
			_iter += 1;
		}
		_option = dialogo[_i][$ "TIENE_OPCIONES"];
		if(_option != "0")
		{
			_num_options = dialogo[_i][$ "NUMERO_OPCIONES"];
			switch(_num_options)
			{
				case "2":
					_option1 = dialogo[_i][$ "OPCION1"];
					_option2 = dialogo[_i][$ "OPCION2"];
					if(_option1 != "" and _option2 != "") 
					{
						global.topics[$ _topico][_iter] = CHOICE(_textbox,OPTION(_option1,"Chose "+_option1),OPTION (_option2, "Chose "+_option2));
						global.topics[$ "Chose "+_option1] = [];
						global.topics[$ "Chose "+_option2] = [];
						_option_create = true;
						_topico_comp = dialogo[_i+1][$ "conversation_response"];
						_iter = 0;
					}
				break;	
				case "3":
					_option1 = dialogo[_i][$ "OPCION1"];
					_option2 = dialogo[_i][$ "OPCION2"];
					_option3 = dialogo[_i][$ "OPCION3"];
					if(_option1 != "" and _option2 != "" and _option3 != "")
					{
						global.topics[$ _topico][_iter] = CHOICE(_textbox,OPTION(_option1,"Chose "+_option1),OPTION (_option2, "Chose "+_option2),OPTION (_option3, "Chose "+_option3));
						global.topics[$ "Chose "+_option1] = [];
						global.topics[$ "Chose "+_option2] = [];
						global.topics[$ "Chose "+_option3] = [];
						_option_create = true;
						_topico_comp = dialogo[_i+1][$ "conversation_response"];
						_iter = 0;
					}
				break;	
				case "4":
					_option1 = dialogo[_i][$ "OPCION1"];
					_option2 = dialogo[_i][$ "OPCION2"];
					_option3 = dialogo[_i][$ "OPCION3"];
					_option4 = dialogo[_i][$ "OPCION4"];
					if(_option1 != "" and _option2 != "" and _option3 != "" and _option4 != "") 
					{
						global.topics[$ _topico][_iter] = CHOICE(_textbox,OPTION(_option1,"Chose "+_option1),OPTION (_option2, "Chose "+_option2),OPTION (_option3, "Chose "+_option3),OPTION (_option4, "Chose "+_option4));
						global.topics[$ "Chose "+_option1] = [];
						global.topics[$ "Chose "+_option2] = [];
						global.topics[$ "Chose "+_option3] = [];
						global.topics[$ "Chose "+_option4] = [];
						_option_create = true;
						_topico_comp = dialogo[_i+1][$ "conversation_response"];
						_iter = 0;
					}
				break;	
			}
		}
		else // _option == 0
		{
			_textbox = dialogo[_i][$ "TEXTBOX"];
			if(_textbox != "")
			{
				global.topics[$ _topico][_iter] = TEXT(_textbox);
				_iter += 1;
			}
			else continue;
		}
	}
}






//global.topics[$ "Breakfast"] = [
//	//SPEAKER("Sam",spr_portrait_sam,PORTRAIT_SIDE.LEFT),
//	CHOICE("What do you want for breakfast",OPTION("Eggs", "Chose Eggs"),OPTION ("Pancakes", "Chose Pancakes"))
//];
	
//	global.topics[$ "Chose Eggs"] = [
//		TEXT ("That's a healthy way to start the day!"),
//		GOTO("End of breakfast")
//	];

//	global.topics[$ "Chose Pancakes"] = [
//		TEXT("Ooh, yummy!"),
//		GOTO("End of breakfast")
//	];
	
//		global.topics [$ "End of breakfast"] = [
//			TEXT("Goodbye, now")
//		];


global.topics[$ "Batallando"] = [
	SPEAKER("Rana",spr_pt_rana, PORTRAIT_SIDE.LEFT),
	TEXT("Aja! encontraste mi [rainbow]escondite secreto[/rainbow], debes saber que soy un [c_blue]agente secreto"),
	TEXT("Espera... No se si lo sabias, bueno no importa."),
	TEXT("Ahora debo [wave][c_yellow]matarte!"),
	FIGHT(spr_bg_forest2,obj_fight_rana)
];
		
global.topics[$ "signhouse1"] = [
	TEXT("El Viejo Sabio le invita a entrar a la casa, no es que tenga algo mejor que hacer"),
];
global.topics[$ "signenemy1"] = [
	TEXT("Peligro!!! Monstruo mas adelante, evite comentarios sobre su cabello."),
];

global.topics[$ "signhouse2"] = [
	
	TEXT("¿Realmente [c_yellow]esperas a que te diga donde ir? Los letreros no hablamos."),
	TEXT("Vamos muchacho, tu puedes, solo debes seguir la instrucción.-->"),
	TEXT("¿Sigues Aquí? El juego no se va a completar solo."),
	TEXT("Ya me harté de tí. Adiós!.")
	];
	
global.topics[$ "signwarning1"] = [
	TEXT("El Viejo Sabio le invita a entrar a la casa, no es que tenga algo mejor que hacer"),
];
global.topics[$ "signwarning2"] = [
	TEXT("Territorio deconocido, nadie que haya pasado de este punto, ha vuelto para contarlo.")
	
];
global.topics[$ "conejeando"] = [
	SPEAKER("Conejita",spr_pt_coneja, PORTRAIT_SIDE.LEFT),
	TEXT("Esto es una prueba de sfx de diálogo, necesito algunas palabras laaaaaargas y demas que textos cortos y piolas"),
	TEXT("Y demás que necesito otro textbox para ir probando si funciona bien"),
	TEXT("Con eso debería ser suficiente... ¿no?")
];