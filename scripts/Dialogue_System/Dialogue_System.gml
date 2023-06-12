
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

global.topics = {};

global.topics[$ "Introduccion"] = [
	//SPEAKER("Viejo Sabio",spr_portrait_ViejoSabio, PORTRAIT_SIDE.LEFT),
	TEXT("fiuu, esta vez si que se lucieron, No sabes de lo que hablo?"),
	TEXT("Bueno, nada importante, lo unico que tienes que saber, es que, en este mundo, todo funciona con el ritmo."),
	TEXT("Por tu cara de confusion veo, que la inteligencia no es lo tuyo JA!JA!JA!."),
	TEXT("Ni tampoco el buen humor, en fin, si lo que necesitas es respuestas, al unico lugar al que puedes acceder no queda lejos de aqui"),
];

global.topics[$ "Breakfast"] = [
	//SPEAKER("Sam",spr_portrait_sam,PORTRAIT_SIDE.LEFT),
	CHOICE("What do you want for breakfast",
		OPTION("Eggs", "Chose Eggs"),
		OPTION ("Pancakes", "Chose Pancakes"))
];
	
	global.topics[$ "Chose Eggs"] = [
		TEXT ("That's a healthy way to start the day!"),
		GOTO("End of breakfast")
	];

	global.topics[$ "Chose Pancakes"] = [
		TEXT("Ooh, yummy!"),
		GOTO("End of breakfast")
	];
	
		global.topics [$ "End of breakfast"] = [
			TEXT("Goodbye, now")
		];
global.topics[$ "signhouse1"] = [
	TEXT("El Viejo Sabio le invita a entrar a la casa, no es que tenga algo mejor que hacer"),
	TEXT("vddfdfdfd dfdfdff")
];

