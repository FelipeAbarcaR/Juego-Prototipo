
//-----------------TYPING----------------//

// The one function that you need to call!
// Creates a textbox and starts a conversation.
// @param topic - What topic the dialogue box should use

function startDialogue(topic) {
	if (instance_exists(obj_textbox)) return;
	
	var inst = instance_create_depth(x, y, -999, obj_textbox);
	inst.setTopic(topic);

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

dialogo = undefined;

if(file_exists(working_directory + "prueba_dialogo.json") )
{
	var json = "";
	var file = file_text_open_read(working_directory + "prueba_dialogo.json");
	
	while(file_text_eof(file) == false)
	{
		json += file_text_readln(file);
	}
	file_text_close(file);
	
	dialogo = json_parse(json);
}


global.topics = {};
global.topics_names = [];

var Topico = "";
var textbox = "";

for (var i = 0; i < array_length(dialogo); i++)
{
	Topico = dialogo[i][$ "conversation_name"];
	
	if(!struct_exists(global.topics,Topico))
	{
		global.topics[$ Topico]= [];
		global.topics_names[i] = Topico;
		textbox = dialogo[i][$ "TEXTBOX"];
		if(textbox != "")
		{
			global.topics[$ Topico][i] = TEXT(textbox);
		}
		else continue; //esto va a cambiar
	}
	else // si es que existe ya el topico en la global.topics
	{
		if(textbox != "")
		{
			global.topics[$ Topico][i] = TEXT(textbox);
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
	TEXT("Aja! encontraste mi escondite secreto, debes saber que soy un agente secreto"),
	TEXT("Espera... No se si lo sabias, bueno no importa."),
	TEXT("Ahora debo matarte!"),
	NEWROOM(rm_pelea)
];
		
global.topics[$ "signhouse1"] = [
	TEXT("El Viejo Sabio le invita a entrar a la casa, no es que tenga algo mejor que hacer"),
];
global.topics[$ "signenemy1"] = [
	TEXT("Peligro!!! Monstruo mas adelante, evite comentarios sobre su cabello."),
];

global.topics[$ "signhouse2"] = [
	
	TEXT("¿Realmente esperas a que te diga donde ir? Los letreros no hablamos."),
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
