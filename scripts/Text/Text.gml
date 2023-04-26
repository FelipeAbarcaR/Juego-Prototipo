/// @desc Ninesliceboxstretched(sprite, x1, x2, y1, y2)
/// @arg sprite
/// @arg x1 left
/// @arg y1 top
/// @arg x2 right
/// @arg y2 down
/// @arg index image index

function Ninesliceboxstretched(){
	var _size = sprite_get_width(argument0) / 3;
	var _x1	= argument1;
	var _y1 = argument2;
	var _x2 = argument3;
	var _y2 = argument4;
	var _index = argument5;
	var _w = _x2 - _x1;
	var _h = _y2 - _y1;

	//middle
	draw_sprite_part_ext(argument0, _index, _size, _size, 1, 1, _x1 + _size, _y1 + _size, _w-(_size*2), _h-(_size*2), c_white, 1);

	//corners
	//top left
	draw_sprite_part(argument0, _index, 0 , 0 ,_size, _size, _x1, _y1);
	//top right
	draw_sprite_part(argument0, _index, _size * 2, 0, _size, _size, _x1 + _w - _size, _y1);
	//bottom left
	draw_sprite_part(argument0, _index, 0, _size*2, _size, _size, _x1, _y1 + _h - _size);
	//bottom right
	draw_sprite_part(argument0, _index, _size*2, _size*2, _size, _size, _x1 + _w - _size, _y1 + _h - _size);

	// EDGES
	//left edge
	draw_sprite_part_ext(argument0, _index, 0, _size, _size, 1, _x1, _y1 + _size, 1, _h-(_size*2), c_white, 1);
	//right edge
	draw_sprite_part_ext(argument0, _index, _size*2, _size, _size, 1, _x1+_w -_size, _y1+_size, 1, _h - (_size*2), c_white, 1);
	//top edge
	draw_sprite_part_ext(argument0, _index, _size, 0, 1, _size, _x1+_size, _y1, _w - (_size*2), 1, c_white, 1);
	//bottom edge
	draw_sprite_part_ext(argument0, _index, _size, _size*2, 1, _size, _x1 + _size, _y1 + _h - (_size), _w - (_size*2), 1 , c_white, 1);

}

function NewTextBox (){
	
	/// @arg Message
	/// @arg Background 
	/// @arg [Responses]
	
	var _obj;
	if(instance_exists(obj_text)) _obj = obj_text_queued; else _obj= obj_text;
	
	with(instance_create_layer(0,0, "Instances", _obj))
	{
		//el argument[0] hace que no esa ncesario especificar la cantidad de argumentos en la funcion
		message = argument[0];
		if(instance_exists(other)) origininstance = other.id else origininstance = noone;
		if(argument_count >1) background = argument[1]; else background = 1;
		if(argument_count >2) 
		{
			//Guardar las respuestas del argumento en la variable correctamente
			var _array = argument[2];
			
			for( var _i = 0; _i < array_length(_array) ; _i++)
			{
				responses[_i] = _array[_i];
			}
			// Recortar los marcadores de las respuestas
			for( var i =0; i < array_length(responses); i++)
			{
				var _marketposition = string_pos(":",responses[i]);
				//extrae el texto de cada respuesta que tenga
				responsescript[i] = string_copy(responses[i] ,1 ,_marketposition - 1);
				responsescript[i] = real(responsescript[i]);
				responses[i] = string_delete(responses[i],1,_marketposition);
			}	
		}
		else
		{
			responses = [-1];
			responsescript = [-1];
		}
	}
	
	//with(obj_player)
	//{
	//	if(state != PlayerStateLocked)
	//	{
	//		laststate = state;
	//		state = PlayerStateLocked;
	//	}
	//}
}


function DialogueResponses(argument0){
	/// @arg Response
	
	
	switch(argument0)
	{
		case 0: break;
		
		case 1:
		{
			NewTextBox("you gave response A!", 1);
			with(obj_slime)
			{
				EntityState = EntityChase;
			}
			break;
		}
		
		case 2: NewTextBox("You gave response B! Any further response?", 1, ["3:Yes!","4:No."]); break;
		
		case 3: NewTextBox("Thanks for your responses!",0); break;
		
		//case 4: 
		//{
		//	NewTextBox("Thanks!",2);
		//	NewTextBox("I think i left it in that scary cave to the north east!",2);
		//}break
		
		//case 5: NewTextBox(":(",2); break;
		
		default: break;
	}

}

function SetDefaultsforText(){
	
	//el line break es cuando cambia de linea 
	line_break_pos[0,page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
}


/// @param string
function ScriptText(_text){
	
	SetDefaultsforText();
	text[page_number] = _text;
	page_number++;
}

/// @param text_id
function GameText (_text_id){
	
	switch(_text_id)
	{
		case "NPC 1":
			ScriptText("do you want to help me pls?!");
			ScriptText("jfperjfopefjerpfojfpoejfepjfepfenpgern")
				ScriptOptions("Yeah!","NPC 1 - yes");
				ScriptOptions("No I'm sorry","NPC 1 - no");
			break;
			case "NPC 1 - yes":
				ScriptText("Ohhhh thanks you so much!");
				break;
			case "NPC 1 - no":
				ScriptText("YOU ARE SO SELFISH!");
				break;
		
		case "NPC 2":
		
			ScriptText("Hi! I'm NPC 2");
			ScriptText("Hi! I'm NPC 2ccnocnconc onodnwod o dondodmwod odwmdo");
			ScriptText("Hi! I'm NPC 2");
			break;
		
		case "NPC 3":
		
			break;
		
	}
	
}
	/// @param text_id
function CreateTextbox (_text_id){
	
	with (instance_create_depth(0,0,-9999,obj_text))
	{
	GameText(_text_id);
	} 
	
}
	/// @param text_id
	/// @param link_id
function ScriptOptions (_option, _link_id){
	
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}