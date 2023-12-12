/// CUSTOMIZABLE PROPERTIES

textbox_states=
{
	dibujando_pt:0,
	creciendo_tb:1,
	escribiendo:2,
	esperando:3,
	destruyendose:4,
	invisible:5
}

textbox_state=textbox_states.dibujando_pt;
play_sfx(sfx_warp);



// Input
confirm_key		= vk_space; // button to press to go to the next page
up_key			= vk_up;
down_key		= vk_down;
max_input_delay = 5; // how many frames to ignore input
input_delay		= max_input_delay;


// Position
margin	= 16; // how much space the textbox gets from the edges of the screen
padding	= 8; // how much space things inside the textbox get
width	= 400;
height	= 260;

show_debug_message(string(x)+" "+string(y));


view_x	= uc_get_view_x();
view_y	= uc_get_view_y();

gui_width	= display_get_gui_width();
gui_height	= display_get_gui_height();

view_width	=	uc_get_view_width();
view_height	=	uc_get_view_height();

//POSITION IN GUI
gui_x	=	565//gui_width*0.45;
gui_y	=	460//gui_height*0.70;

// Text
text_font = "fnt_dialogo_conciencia3";
text_color = c_white;
text_speed = 0.20;
text_x = padding;
text_y = padding;
text_width = width - padding * 2;
lenght_shift_format=80; //max lenght to shift text from middle center to upper top corner
text_wrap_width=width*0.2;
text_wrap_height=height*0.2;

//Portrait
portrait_sprite = -1;
portrait_width = 256;
portrait_height = 256;	
portrait_x = padding;
portrait_y = padding;

//portrait shader
DissolveSettings(spr_mask_cloud,0,c_white,c_white,0.5)
//portrait_shader=sha_luma_mask;


luma_time=0;

luma_time_speed=0.015;

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

//paw in end text
paw_index=0;
paw_sprite=spr_textbox_paw_con;
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
	//actions = global.topics[$ topic];
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
increasing_value=0;
starting_y=y+height/2;
delta_scaling=0.03;

