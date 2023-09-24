/// @description start recording and save
// You can write your code in this editor

if(!record)
{
    record=true;
}else
{
	var file;
	file = file_text_open_write(filename);
	file_text_write_string(file, beat_map);
	file_text_close(file);

	show_debug_message("Beat map guardado "+string(file));
}