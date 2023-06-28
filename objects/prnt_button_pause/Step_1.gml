//Input
//si ocupamos mouse_x o mouse_y nos daran los coordenadas en la room, pero nosotros queremos las del gui
var _mouseX = device_mouse_x_to_gui(0);
var _mousey = device_mouse_y_to_gui(0);

hover = point_in_rectangle(_mouseX,_mousey,x,y,x + button_witdh,y + button_height);

lclick = mouse_check_button_pressed(mb_left);
rclick = mouse_check_button_pressed(mb_right);
