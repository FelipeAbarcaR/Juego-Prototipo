
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
	inst.setTopic(topic);
	inst.dialogue_sounds=activate.dialogue_sounds;

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
function DialogueSound(){

	if (dialogue_sounds != -1){

		if(current_tb_sound == -1)
		{
		    ChooseSound();
			audio_play_sound(current_tb_sound,10,0);
		}else
		{
		    var _audio_playing=audio_is_playing(current_tb_sound)
			if(!_audio_playing)
			{
			    ChooseSound();
				audio_play_sound(current_tb_sound,10,0);
			}
		}
	}


}
function ChooseSound()
{
	var _sounds_number=array_length(dialogue_sounds)-1
    sound_index=irandom(_sounds_number);
	current_tb_sound=dialogue_sounds[sound_index];
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


var Topico = "";
var textbox = "";
var iter = 2;
var speaker = "";
var speakercomp = "";
var sprite = 0;
var portrait = 0;

//guardando la data en global.topics

for (var i = 0; i < array_length(dialogo); i++)
{
	Topico = dialogo[i][$ "conversation_name"];
	
	if(!struct_exists(global.topics,Topico))
	{
		global.topics[$ Topico]= [];
		textbox = dialogo[i][$ "TEXTBOX"];
		speaker = dialogo[i][$ "SPEAKER"];
		speakercomp = speaker;
		iter = 2;
		
		if(speaker != "")
		{
			switch(speaker)
			{
				default: 
					sprite = spr_ViejoSabio;
				break;
			}
			global.topics[$ Topico][0] = SPEAKER(speaker,sprite,PORTRAIT_SIDE.LEFT);
			portrait += 1;
			if(textbox != "")
			{
				global.topics[$ Topico][1] = TEXT(textbox);
			}
		}
		else continue; //esto va a cambiar
	}
	else // si es que existe ya el topico en la global.topics
	{
		speaker = dialogo[i][$ "SPEAKER"];
		if(speaker != speakercomp)
		{
			switch(speaker)
			{
				default: 
					sprite = spr_ViejoSabio;
				break;
			}
			if(portrait == 0) 
			{
				global.topics[$ Topico][iter] = SPEAKER(speaker,sprite,PORTRAIT_SIDE.LEFT);
				portrait += 1;
			}
			else
			{
				global.topics[$ Topico][iter] = SPEAKER(speaker,sprite,PORTRAIT_SIDE.RIGHT);
				portrait = 0;
			}
			speakercomp = speaker;
			iter += 1;
		}
		textbox = dialogo[i][$ "TEXTBOX"];
		if(textbox != "")
		{
			global.topics[$ Topico][iter] = TEXT(textbox);
			iter += 1;
		}
		else continue; //esto va a cambiar
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
	TEXT("Aja! encontraste mi [rainbow]escondite[fnt_text] secreto[/rainbow], debes [fnt_Dogica]saber que soy un [c_blue] agente secreto"),
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

	TEXT("[DogicaBold]¿Realmente esperas a que te diga donde ir? Los letreros no hablamos."),
	TEXT("[fnt_Dogica]Vamos muchacho, tu puedes, solo debes seguir la instrucción.-->"),
	TEXT("[fnt_RODIN]¿Sigues Aquí? El juego no[spr_Torch] se va a completar solo."),
	TEXT("[fnt_text]Ya me harté de tí. Adiós!.")
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
	TEXT("Y demás que necesito otro textbox para ir [Rania_2] probando si funciona bien"),
	TEXT("Con eso debería ser suficiente... ¿no?"),
];
