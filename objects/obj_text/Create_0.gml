depth = -9999;
//textbox parameters
textbox_width = 527;
textbox_height = 89;
border = 12;
line_sep = 12;
line_width = textbox_width - border*2;
txtb_spr = spr_textbox_bg;
txtb_img = 0;

//the text 

page = 0;
page_number = 0;
text[0]="";
text_length[0] = string_length(text[0]);

	//char[caracteres,pagina]
char[0,0] = "";
char_x[0,0] = 0;
char_y[0,0] = 0;

draw_char = 0;
text_spd = 1;

//Options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;

//effects

SetDefaultsforText();
last_free_space = 0;

