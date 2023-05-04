
//-----------------TYPING----------------//

// The one function that you need to call!
// Creates a textbox and starts a conversation.
// @param topic - What topic the dialogue box should use
function startDialogue(topic) {
	if (instance_exists(obj_textbox)) return;
	
	var inst = instance_create_depth(x, y, -999, obj_textbox);
	inst.setTopic(topic);
	
	with(obj_player)
	{
		if(state != PlayerStateLocked)
		{
			laststate = state;
			state = PlayerStateLocked;
		}
	}
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

#macro TEXT new TextAction
#macro SPEAKER new SpeakerAction
#macro CHOICE new ChoiceAction
#macro OPTION new OptionAction
#macro GOTO new GotoAction

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

global.topics[$ "Example"] = [
	TEXT("Hello world!"),
	TEXT("I sure hope this dialogue system works first try!"),
	TEXT("We should test having a page with lots of words in it, to make sure that the line break feature is working properly.")
];

global.topics[$ "Good Morning"] = [
	SPEAKER("Sam", spr_portrait_sam,PORTRAIT_SIDE.LEFT),
	TEXT("Good Morning! How are you today?"),
	SPEAKER ("Rudy", spr_portrait_rudy, PORTRAIT_SIDE.RIGHT),
	TEXT("Im doing very well, and you?"),
	SPEAKER("Sam", spr_portrait_sam,PORTRAIT_SIDE.LEFT),
	TEXT("I can't complain, except for one thing..."),
	SPEAKER ("Sam", spr_portrait_sam_mad),
	TEXT("the supermarket was out of carrot juice today!"),
];

global.topics[$ "Breakfast"] = [
	SPEAKER("Sam",spr_portrait_sam,PORTRAIT_SIDE.LEFT),
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
			TEXT("Goodbye, now"),
		];



