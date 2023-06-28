//lo que esta dentro de la funcion es llama Ternary Operator, donde hover en la condicion, c_gray el true y c_black el false
draw_set_color(hover ? c_gray : c_black);
draw_set_alpha(0.4);

//el ultimo parametro dice si quiere un rctangulo normal (0) o solamente el borde (1)
draw_rectangle(x , y, x + button_witdh, y + button_height,0);

draw_set_alpha(1);
draw_set_color(c_white);

//Draw outline
draw_rectangle(x - 1,y - 1, x + button_witdh, y + button_height, 1);