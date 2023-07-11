/// @description Insert description here
// You can write your code in this editor

var file;
file = file_text_open_write("beatmap.txt");
file_text_write_string(file, beat_map);
file_text_close(file);

show_debug_message("Beat map guardado "+string(file));