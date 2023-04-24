
/// @desc dibujar el box del texto
Ninesliceboxstretched(spr_textbox_bg,x1,y1,x2,y2,background);
// es buena praticar poner ocupar estas funciones cuando escribamos texto
draw_set_font(fnt_text)
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

//string copy copia el texto (message) desde el primer caracter (1) hasta donde hara progresado (textprogress)
var _print = string_copy(message, 1, textprogress);

//si hay una respuesta (el -1 es porque es el valor de que no hay nada)
if((responses[0] != -1) && (textprogress >= string_length(message)))
{
	//esto va desde 0 a 2, dado que son las cantidades de respuestas que tiene response ?
	for(var i =0; i < array_length(responses); i++)
	{
		_print += "\n";
		if(i == responseselected) _print += "> ";
		_print += responses[i];
		if(i == responseselected) _print += " <";
	}
}	
		
			
//esto escribe el texto en el juego con un efecto de sombra
draw_text((x1 + x2)/2, y1+8 , _print);
draw_set_color(c_white);
draw_text((x1+x2)/2, y1+7, _print);
