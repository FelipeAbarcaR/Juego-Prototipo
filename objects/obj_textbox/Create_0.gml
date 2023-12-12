/// CUSTOMIZABLE PROPERTIES

// Input
confirm_key = vk_space; // button to press to go to the next page
up_key = vk_up;
down_key = vk_down;
max_input_delay = 5; // how many frames to ignore input
input_delay = max_input_delay;

// Position
margin = 56; // how much space the textbox gets from the edges of the screen
padding = 12; // how much space things inside the textbox get
width = floor(display_get_gui_width()*(5/8));
height = floor(display_get_height()/6.5);

x = (display_get_gui_width()- width)/2;
y = display_get_gui_height() - height - margin;


// Text
text_font = "fnt_RODIN";
text_color = c_white;
text_speed = 0.45;
text_x = padding;
text_y = padding;
text_width = width - padding * 2;
lenght_shift_format=80; //max lenght to shift text from middle center to upper top corner

//Portrait

portrait_sprite = -1;
portrait_width = height-padding*2;
portrait_height = height-padding*2;
portrait_x = padding;
portrait_y = padding;

//Speaker

speaker_font = "fnt_Dogica";
speaker_color = #f0e1a3;
speaker_name = "";
speaker_width = sprite_get_width(spr_name);
speaker_height = sprite_get_height(spr_name);
speaker_x = padding+portrait_width/2;
speaker_y = height-padding-speaker_height;

//Background

bg_type	=	BG_TYPE.blurry;

bg_sign_sprite	=	spr_textbox_sign_background;
bg_NPC_sprite	=	spr_textbox_bg;

bg_index	=	0;

//Option
option_x = padding;
option_y = padding *-6;
option_spacing = 40;
option_selection_indent = 20;
option_width = 100;
option_height = 35;
option_text_x = 10;
option_text_color = c_white;

//Room
new_room=-1;


//Fight
fight_enemy=-1;
fight_bg=-1;
start_fight=false;
fight_concluded=false;
win_topic=-1;
lose_topic=-1;

//Inventory
inv_type=0;
item_quantity=0;

//Automove-
automove_x=-1;
automove_y=-1;
automove_active=false;

//Activate activate event user depend on wich numbergot called from function ACTIVATE
user_event_index=-1;
//Crypt
start_crypt=false;

//Events (in case of fighting or moving, or more)
event_mode = false;
/// PRIVATE PROPERTIES

/*** LOOK BUT DO NOT EDIT! ***/
actions = [];
current_action = -1;

text = "";
text_progress = 0;
text_length = 0;

options = [];
current_option = 0;
option_count = 0;

//Conditions
condition1="";
condition2="";
condition3="";
condition4="";

/// Methods
/*** Generally you never need to call these manually ***/


//Sound Effects
sfx_up_down_option=Arrow_Up___Down;
sfx_close_textbox=Close_Textbox;
sfx_open_textbox=Open_Textbox;
sfx_confirm_option=Confirm_Option;

//Start opening sfx
play_sfx(sfx_open_textbox);

// Start a conversation
setTopic = function(topic,_cutscene=false) {
	
	if(_cutscene) actions = global.cutscene_topics[$ topic] else actions = global.topics[$ topic];
	actions = global.topics[$ topic];
	current_action = -1;
	next();
}

minimize_to_destroy=false;

// Move to the next action, or close the textbox if out of actions
next = function() {
	current_action++;
	event_mode=textbox_event.TEXTING;
	if (current_action >= array_length(actions)) 
	{
		global.end_interaction = false;
		global.textover = true;
		
		//call to player to update values
		var _player=global.room_data[global.currentroom][Index.mainchar];
		with(_player)
		{
		    PlayerUpdateStatus();
		}
	
		minimize_to_destroy=true;
		play_sfx(sfx_close_textbox);
	}
	else {
		actions[current_action].act(id);
	}
}

scribble_object=-1;
typing_speed=text_speed;
typist=scribble_typist();
typist.in(typing_speed,0);

// Set the text that should be typed out
setText = function(newText) {
	text = newText;
	text_length = string_length(newText);
	text_progress = 0;
	scribble_object = scribble(text);
}

//Dialogue SFX
current_tb_sound=-1;
dialogue_sounds=-1;

//shader effects
blurry_shader = shader_blur;
u_vRatio = shader_get_uniform(blurry_shader, "u_vRatio");
u_threshold = shader_get_uniform(blurry_shader, "u_threshold");
surface_textbox = -1;
vRatio = 1.0;
blurValue=1.0;
hola=0;
hola2=0;


//upscaling textbox draw
increasing_value=0.0;
starting_y=y+height/2;
delta_scaling=0.1;

