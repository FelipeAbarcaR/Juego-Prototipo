/// CUSTOMIZABLE PROPERTIES

// Input
confirm_key = vk_space; // button to press to go to the next page
up_key = vk_up;
down_key = vk_down;
max_input_delay = 5; // how many frames to ignore input
input_delay = max_input_delay;

// Position
margin = 32; // how much space the textbox gets from the edges of the screen
padding = 8; // how much space things inside the textbox get
width = display_get_gui_width()*(5/8);
height = display_get_height()/5;

x = (display_get_gui_width()- width)/2;
y = display_get_gui_height() - height - margin;


// Text
text_font = "fnt_RODIN";
text_color = c_white;
text_speed = 0.6;
text_x = padding;
text_y = padding*3;
text_width = width - padding * 2;

//Portrait

portrait_sprite = -1;
portrait_width = height-padding*2;
portrait_height = height-padding*2;
portrait_x = padding;
portrait_y = padding;

//Speaker

speaker_font = "fnt_Dogica";
speaker_color = #464633;
speaker_name = "";
speaker_width = sprite_get_width(spr_name);
speaker_height = sprite_get_height(spr_name);
speaker_x = padding+portrait_width/2;
speaker_y = height-padding-speaker_height;
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
already_fighting = false;
fight_concluded=false;
win_topic=-1;
lose_topic=-1;

//Inventory
inv_type=0;
item_quantity=0;

/// PRIVATE PROPERTIES

/*** LOOK BUT DO NOT EDIT! ***/
actions = [];
current_action = -1;

text = "";
text_progress = 0;
text_length = 0;



enum PORTRAIT_SIDE
{
	LEFT,
	RIGHT,
}
	

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
PlaySFX(sfx_open_textbox);

// Start a conversation
setTopic = function(topic) {
	actions = global.topics[$ topic];
	current_action = -1;
	
	next();
}
minimize_to_destroy=false;
// Move to the next action, or close the textbox if out of actions
next = function() {
	current_action++;
	if (current_action >= array_length(actions)) 
	{
		with (o_player) 
		{
			global.textover = true;
			state = states.IDLE;
		}
		//call to player to update values
		var _player=global.room_data[global.currentroom][index.mainchar];
		with(_player)
		{
		    PlayerUpdateStatus();
		}
	
		minimize_to_destroy=true;
		PlaySFX(sfx_close_textbox);
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

