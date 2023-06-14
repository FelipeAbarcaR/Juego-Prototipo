global.res = {
	width: 480,
	height: 270,
	scale: 3
}

var _width = global.res.width * global.res.scale;
var _height = global.res.height * global.res.scale;

//Resolucion 
surface_resize(application_surface,_width,_height);

//Ventana
window_set_size(_width,_height);

//GUI
display_set_gui_size(_width,_height);

//Centro de la ventana
var _displayWidth = display_get_width();
var _displayHeight = display_get_height();

window_set_position(_displayWidth/2 - _width/2 , _displayHeight/2 - _height/2 );



function ScreenShake(_magnitude,_length){
	with(global.icamara)
	{
		if(_magnitude > shakeremain)
		{
			shakemagnitude = _magnitude;
			shakeremain = shakemagnitude;
			shakelength = _length;
		}
	}
}


function RoomTransition(_type,_targetroom){

	if(!instance_exists(obj_transition))
	{
		with(instance_create_depth(0,0,-9999,obj_transition))
		{
			typee = _type;
			target = _targetroom;
		}
	}
	else show_debug_message("Trying to transition while transition is happening");
	
}