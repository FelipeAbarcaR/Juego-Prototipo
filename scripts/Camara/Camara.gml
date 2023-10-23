global.res = {
	width: 480,
	height: 270,
	guiwidth: 480*3,
	guiheight: 270*3,
	scale: 3
}

var _width = global.res.width;
var _height = global.res.height;

////Resolucion 
//surface_resize(application_surface,_width,_height);

////Ventana
//window_set_size(_width*global.res.scale,_height*global.res.scale);

////GUI
//display_set_gui_size(global.res.guiwidth,global.res.guiheight);

//Centro de la ventana
//var _displayWidth = display_get_width();
//var _displayHeight = display_get_height();

//view_wport[0]=_width;
//view_hport[0]=_height;

//window_set_position(_displayWidth/2 - _width/2 , _displayHeight/2 - _height/2 );

function RoomTransition(_type,_roomTarget){

	if(!instance_exists(obj_transition))
	{
		var _transition=instance_create_depth(0,0,-9999,obj_transition);
		with(_transition)
		{
			typee = _type;
			target = _roomTarget;
			return _transition;
		}
	}
	else show_debug_message("Trying to transition while transition is happening");
	
}