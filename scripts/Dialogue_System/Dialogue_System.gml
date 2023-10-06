
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
#macro INVENTORY new ItemAction
#macro AUTOMOVE new AutomoveAction
#macro CRYPT new CryptAction

function startDialogue(topic) {
	if (instance_exists(obj_textbox)) return;
	var inst = instance_create_depth(x, y, -999, obj_textbox);
	inst.dialogue_sounds= activate.dialogue_sounds;
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

function checkConditions(){
	
	var conditions = [condition1, condition2, condition3, condition4];
	var arrays = [global.items, global.attributes, global.talks];
	var found = true;
	var condition_exist=false;
	var condition_count=0;

	for (var i = 0; i < array_length(conditions); i++) {
	    if (conditions[i] != "") {
			condition_exist=true;
			condition_count+=1;
			var match = false;
	        for (var j = 0; j < array_length(arrays); j++) {
				
	            var arrayToSearch = arrays[j];
				
	            if (array_contains(arrayToSearch, conditions[i])) {
	                match = true;
	                break;
	            }
				if (!match){
					found=false;
				}
	        }
	        }
	    }
	if(condition_exist)
	{
	    show_debug_message("condition found in text");
	}
	if(condition_exist && found)
	{
	    show_debug_message("all conditions passed ("+string(condition_count)+")");
	}
	
	if (condition_exist && !found) {
	    // If at least one condition doesn't exist, reset the variables to "" anad next
		next();
	    condition1 = "";
	    condition2 = "";
	    condition3 = "";
	    condition4 = "";
}
}
	
	
//-----------------ACTIONS------------------//
	
function DialogueAction() constructor {
	// el constructor hace que pueda llamar a la funcion para hacer una estructura de datos
	act = function() { };
}

function TextAction(_text,_cond1=0,_cond2=0,_cond3=0,_cond4=0) : DialogueAction() constructor {
	// Define new text to type out
	// el : significa que hereda de la funcion DialogueAction
	
    text = _text;
    
    var new_conditions = [_cond1, _cond2, _cond3, _cond4];
	condicion1="";
	condicion2="";
	condicion3="";
	condicion4="";
    var textbox_conditions = [condicion1, condicion2, condicion3, condicion4];

    for (var i = 0; i < array_length(new_conditions); i++) {
        if (new_conditions[i] != 0) {
            textbox_conditions[i] = new_conditions[i];
        } else {
            textbox_conditions[i] = "";
        }
    }

    // update the original condition variables:
	
    condicion1 = textbox_conditions[0]; 
    condicion2 = textbox_conditions[1];
    condicion3 = textbox_conditions[2];
    condicion4 = textbox_conditions[3];
	
	act = function(textbox) {
		textbox.setText(text);
		textbox.condition1=condicion1;
		textbox.condition2=condicion2;
		textbox.condition3=condicion3;
		textbox.condition4=condicion4;
		textbox.event_mode=textbox_event.TEXTING;
	}
}

function SpeakerAction (_name,_sprite = undefined,_side = undefined) : DialogueAction() constructor{

//Set the speaker its portrait and side the portrait is on 	

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

function FightAction(_topicWIN,_topicLOSE) : DialogueAction() constructor{
	topic_if_win = _topicWIN;
	topic_if_lose = _topicLOSE;
	
	act = function(textbox){
	textbox.fight_bg=global.activate.fight_bg;
	textbox.fight_enemy=global.activate.fighter;
	textbox.win_topic=topic_if_win;
	textbox.lose_topic=topic_if_lose;
	textbox.start_fight=true;
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

function AutomoveAction(_x,_y) : DialogueAction() constructor{
	
	player_x=_x;
	player_y=_y;
	
	act = function(textbox)
	{
		textbox.automove_x=player_x;
		textbox.automove_y=player_y;
		textbox.automove_active=true;
	}
	
}
	
function CryptAction() : DialogueAction() constructor{
	
	act = function(textbox)
	{
		textbox.start_crypt=true;
		textbox.next();
	}
	
}
function ItemAction(_itemid,_quantity) : DialogueAction() constructor{
	
	inv_quantity=_quantity;
	item_id=_itemid;

	
	act = function(textbox)
	{
		textbox.inv_type=item_id;
		textbox.item_quantity=inv_quantity
	}
	
}

//----------------TOPICS---------------------//

//Importando El JSON del dialogo
dialogo = undefined;

if(file_exists(working_directory + "NPC_dialogues.json"))
{
	var json = "";
	var file = file_text_open_read(working_directory + "NPC_dialogues.json");
	
	while(file_text_eof(file) == false)
	{
		json += file_text_readln(file);
	}
	file_text_close(file);
	
	dialogo = json_parse(json);
}

global.dialogue_order = {};
global.dialogue_loop = {};
global.topics = {};

hola = 10;

var _portrait = 0;

var _npc = "";
var _topico = "";
var _topico_comp = "";
var _textbox = "";
var _condition1 = 0;
var _condition2 = 0;
var _condition3 = 0;
var _condition4 = 0;

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

var _activate = "";
var _activate_arg1 = "";
var _activate_arg2 = "";
var _activate_arg3 = "";

//guardando la data en global.topics

for (var _i = 0; _i < array_length(dialogo); _i++)
{
	_topico = dialogo[_i][$ "conversation_name"];

	if(!struct_exists(global.topics,_topico) and _topico != "")
	{
		global.topics[$ _topico]= [];
		global.dialogue_loop[$ _topico] = real(dialogo[_i][$ "LOOP"]);
		_textbox = dialogo[_i][$ "TEXTBOX"];
		_speaker = dialogo[_i][$ "SPEAKER"];
		_sprite = dialogo[_i][$ "SPRITE"];
		_option = dialogo[_i][$ "TIENE_OPCIONES"];
		_npc = dialogo[_i][$ "OBJ_NAME"];
		_activate = dialogo[_i][$ "ACTIVAR"];
		_speakercomp = _speaker;
		
		if(_npc != "0") 
		{
			if(!struct_exists(global.dialogue_order,_npc)) 
			{
				global.dialogue_order[$ _npc] = [];
				global.dialogue_order[$ _npc][0] = _topico;
			}
			else
			{
				array_insert(global.dialogue_order[$ _npc],array_length(global.dialogue_order[$ _npc]),_topico);
			}
			
		}
		
		if(_speaker != "0")
		{
			if(_sprite != "0")
			{	
				_sprite_portrait = asset_get_index(_sprite);
				array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.LEFT));
				_portrait += 1;
			}
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
						array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]), CHOICE(_textbox,OPTION(_option1,"Chose "+_option1),OPTION (_option2, "Chose "+_option2)));
						global.topics[$ "Chose "+_option1] = [];
						global.topics[$ "Chose "+_option2] = [];
						_option_create = true;
						if(_i < array_length(dialogo)-1) _topico_comp = dialogo[_i+1][$ "conversation_response"];
					}
				break;	
				case "3":
					_option1 = dialogo[_i][$ "OPCION1"];
					_option2 = dialogo[_i][$ "OPCION2"];
					_option3 = dialogo[_i][$ "OPCION3"];
					if(_option1 != "" and _option2 != "" and _option3 != "") 
					{
						array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]), CHOICE(_textbox,OPTION(_option1,"Chose "+_option1),OPTION (_option2, "Chose "+_option2),OPTION (_option3, "Chose "+_option3)));
						global.topics[$ "Chose "+_option1] = [];
						global.topics[$ "Chose "+_option2] = [];
						global.topics[$ "Chose "+_option3] = [];
						_option_create = true;
						if(_i < array_length(dialogo)-1) _topico_comp = dialogo[_i+1][$ "conversation_response"];
					}
				break;	
				case "4":
					_option1 = dialogo[_i][$ "OPCION1"];
					_option2 = dialogo[_i][$ "OPCION2"];
					_option3 = dialogo[_i][$ "OPCION3"];
					_option4 = dialogo[_i][$ "OPCION4"];
					if(_option1 != "" and _option2 != "" and _option3 != "" and _option4 != "") 
					{
						array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),CHOICE(_textbox,OPTION(_option1,"Chose "+_option1),OPTION (_option2, "Chose "+_option2),OPTION (_option3, "Chose "+_option3),OPTION (_option4, "Chose "+_option4)));
						global.topics[$ "Chose "+_option1] = [];
						global.topics[$ "Chose "+_option2] = [];
						global.topics[$ "Chose "+_option3] = [];
						global.topics[$ "Chose "+_option4] = [];
						_option_create = true;	
						// error en la ultima iteracion
						if(_i < array_length(dialogo)-1) _topico_comp = dialogo[_i+1][$ "conversation_response"];	
					}
				break;	
			}
			if(_i < array_length(dialogo)-1) _speaker = dialogo[_i+1][$ "SPEAKER"];
			if(_speaker != "0")
			{
				_sprite_portrait = asset_get_index(_sprite);
				
				if(_portrait == 0) 
				{
					array_insert(global.topics[$ "Chose "+_option1],array_length(global.topics[$ "Chose "+_option1]),SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.RIGHT)); 
					_portrait += 1;
				}
				else // _portrait >= 1
				{
					array_insert(global.topics[$ "Chose "+_option1],array_length(global.topics[$ "Chose "+_option1]),SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.LEFT));
					_portrait = 0;
				}
				_speakercomp = _speaker;
			}
			
		}
		else // _option == 0
		{
			if(_textbox != "0")
			{
				_condition1 = dialogo[_i][$ "CONDICION1"];
				_condition2 = dialogo[_i][$ "CONDICION2"];
				_condition3 = dialogo[_i][$ "CONDICION3"];
				_condition4 = dialogo[_i][$ "CONDICION4"];
				array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),TEXT(_textbox,_condition1,_condition2,_condition3,_condition4));
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
					_speaker = dialogo[_i][$ "SPEAKER"];
					_sprite = dialogo[_i][$ "SPRITE"];
					if(_speaker != "0")
					{
						_sprite_portrait = asset_get_index(_sprite);
							
						if(_portrait == 0) 
						{
							array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.RIGHT)); //esto debe cambiar para hacer mas top
							_portrait += 1;
						}
						else // _portrait >= 1
						{
							array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.LEFT));
							_portrait = 0;
						}
						_speakercomp = _speaker;
					}
					
				}
			}
			_topico_comp = _topico;
		}
		_speaker = dialogo[_i][$ "SPEAKER"];
		if(_speaker != _speakercomp and _speaker != "0")
		{
			_sprite = dialogo[_i][$ "SPRITE"];
			_sprite_portrait = asset_get_index(_sprite);
			
			if(_portrait == 0) 
			{
				array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.LEFT));
				_portrait += 1;
			}
			else // _portrait >= 1
			{
				array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),SPEAKER(_speaker,_sprite_portrait,PORTRAIT_SIDE.RIGHT));
				_portrait = 0;
			}
			_speakercomp = _speaker;
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
						array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),CHOICE(_textbox,OPTION(_option1,"Chose "+_option1),OPTION (_option2, "Chose "+_option2)));
						global.topics[$ "Chose "+_option1] = [];
						global.topics[$ "Chose "+_option2] = [];
						_option_create = true;
						if(_i < array_length(dialogo)-1) _topico_comp = dialogo[_i+1][$ "conversation_response"];
						_iter = 0; // creo que hay que borrarlo
					}
				break;	
				case "3":
					_option1 = dialogo[_i][$ "OPCION1"];
					_option2 = dialogo[_i][$ "OPCION2"];
					_option3 = dialogo[_i][$ "OPCION3"];
					if(_option1 != "" and _option2 != "" and _option3 != "")
					{
						array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),CHOICE(_textbox,OPTION(_option1,"Chose "+_option1),OPTION (_option2, "Chose "+_option2),OPTION (_option3, "Chose "+_option3)));
						global.topics[$ "Chose "+_option1] = [];
						global.topics[$ "Chose "+_option2] = [];
						global.topics[$ "Chose "+_option3] = [];
						_option_create = true;
						if(_i < array_length(dialogo)-1) _topico_comp = dialogo[_i+1][$ "conversation_response"];
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
						array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),CHOICE(_textbox,OPTION(_option1,"Chose "+_option1),OPTION (_option2, "Chose "+_option2),OPTION (_option3, "Chose "+_option3),OPTION (_option4, "Chose "+_option4)));
						global.topics[$ "Chose "+_option1] = [];
						global.topics[$ "Chose "+_option2] = [];
						global.topics[$ "Chose "+_option3] = [];
						global.topics[$ "Chose "+_option4] = [];
						_option_create = true;
						if(_i < array_length(dialogo)-1) _topico_comp = dialogo[_i+1][$ "conversation_response"];
					}
				break;	
			}
		}
		else // _option == 0
		{
			_textbox = dialogo[_i][$ "TEXTBOX"];
			if(_textbox != "")
			{
				_condition1 = dialogo[_i][$ "CONDICION1"];
				_condition2 = dialogo[_i][$ "CONDICION2"];
				_condition3 = dialogo[_i][$ "CONDICION3"];
				_condition4 = dialogo[_i][$ "CONDICION4"];
				array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),TEXT(_textbox,_condition1,_condition2,_condition3,_condition4));
	
			}
			
			_activate=dialogo[_i][$ "ACTIVAR"];
			
			if(_activate != "")
			{
				_activate_arg1 = dialogo[_i][$ "ACT_ARG1"];
				_activate_arg2 = dialogo[_i][$ "ACT_ARG2"];
				_activate_arg3 = dialogo[_i][$ "ACT_ARG3"];

			    switch(_activate)
				{
					case "FIGHT":
					array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),FIGHT(_activate_arg1,_activate_arg2));
					break;
					
					case "ITEM":
					var _act_arg1_r,_act_arg2_r,_act_arg3_r;
					_act_arg1_r=real(_activate_arg1);
					_act_arg2_r=real(_activate_arg2);
					
					array_insert(global.topics[$ _topico],array_length(global.topics[$ _topico]),INVENTORY(_act_arg1_r,_act_arg2_r));
					break;
					
				}
			}
		}
	}
}


//global.topics[$ "Breakfast"] = [
//	//SPEAKER("Sam",spr_portrait_sam,PORTRAIT_SIDE.LEFT),
//	POSTFIGHT(WIN("Chose Eggs"),LOSE ("Chose Pancakes"))
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
	SPEAKER("Pedro",spr_pt_rana, PORTRAIT_SIDE.LEFT),
	TEXT("Si vienes para llevarte mis frituritas te advierto que el último tipo se fue llorando"),
	TEXT("¿Que por qué frituras? ¿Que acaso por ser conejo solo debo comer zanahorias? "),
	TEXT("Esa mirada de juicio me tiene cansado, en guardia, a mover la coneja"),
	FIGHT("pelearanagana","pelearanapierde")
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

global.topics[$ "signCrypt1"] = [
	
	CHOICE("¿Quieres comenzar?",OPTION("Si","Cryptmoveandfight"),OPTION("No","signenemy1"))
];

global.topics[$ "signCrypt2"] = [
	
	CHOICE("¿Quieres comenzar?",OPTION("Si","Cryptmoveandfight2"),OPTION("No","signenemy1"))
];

global.topics[$ "signCrypt3"] = [
	
	CHOICE("¿Quieres comenzar?",OPTION("Si","Cryptmoveandfight3"),OPTION("No","signenemy1"))
];

global.topics[$ "Cryptmoveandfight"] = [
	
	AUTOMOVE(648,750),
	CRYPT()
];
global.topics[$ "Cryptmoveandfight2"] = [
	
	AUTOMOVE(743,542),
	CRYPT()
];
global.topics[$ "Cryptmoveandfight3"] = [
	
	AUTOMOVE(920,606),
	CRYPT()
];
global.topics[$ "signwarning1"] = [
	TEXT("El Viejo Sabio le invita a entrar a la casa, no es que tenga algo mejor que hacer"),
];
global.topics[$ "signwarning2"] = [
	TEXT("Territorio deconocido, nadie que haya pasado de este punto, ha vuelto para contarlo.")
	
];
global.topics[$ "conejeando"] = [
	SPEAKER("Conejita",spr_pt_coneja, PORTRAIT_SIDE.LEFT),
	CHOICE("Che queres pelear o sólo el item?",OPTION("Pelear","conejeandopelea"),OPTION("dash","conejeandoitem"))

];

global.topics[$ "conejeandoitem"] = [
	SPEAKER("Conejita",spr_pt_coneja, PORTRAIT_SIDE.LEFT),
	TEXT("Wena compa, te le voy a dar un item."),
	INVENTORY(ITEM.DASH,1)
];
global.topics[$ "conejeandopelea"] = [
	SPEAKER("Conejita",spr_pt_coneja, PORTRAIT_SIDE.LEFT),
	TEXT("Vamo a pelear ! (con la rana)"),
	FIGHT("pelearanagana","pelearanapierde")
];
global.topics[$ "pelearanagana"] = [
	SPEAKER("Rana",spr_pt_rana, PORTRAIT_SIDE.LEFT),
	TEXT("Suficiente, estas frituritas no valen la pena"),
	TEXT("Toma estos patines, los solía utilizar ATRAVESAR OBSTÁCULOS, pero ahora solo quiero comer frituritas"),
	INVENTORY(ITEM.DASH,1),
	TEXT("En fin, si logras IR AL RITMO, te serán de gran ayuda. Disfrútalos, sin resentimientos")
];
global.topics[$ "pelearanapierde"] = [
	SPEAKER("Rana",spr_pt_rana, PORTRAIT_SIDE.LEFT),
	TEXT("Creo que todo fue un malentendido viejo, sin resentimientos")
];
global.topics[$ "signentrancem1"] = [
	TEXT("Bienvenido a Chill City, lugar de descanso")
];
