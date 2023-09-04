// Follow player
if (cameraFollow) {
	// Player to follow
	var _plr = global.room_data[global.currentroom][index.follow];

	// Get camera properties
	var _camW = camera_get_view_width(camera);
	var _camH = camera_get_view_height(camera);
	
	// Get new position for camera
	var _camX = _plr.x - _camW / 2;
	var _camY = _plr.y - _camH / 2;
	
	// Clamp position to room
	_camX = clamp(_camX, 0, room_width - _camW);
	_camY = clamp(_camY, 0, room_height - _camH);
	
	//Zooming
	
	//global.zoom = mouse_wheel_down() - mouse_wheel_up();
	
	if(global.zoom != 0)
	{
		global.zoom *= 0.1;
		
		//Add to size
		var _addW = _camW * global.zoom;
		var _addH = _camH * global.zoom;
		
		_camW += _addW;
		_camH += _addH;
		
		//Clamping Zoom
		var _prevW = _camW;
		var _prevH = _camH;
		
		_camW = clamp(_camW, global.res.width/3,room_width);
		_camH = clamp(_camH, global.res.height/3,room_height);
		
		if(_camW/_camH == 1.777777777777778 && (_prevW == _camW || _prevH == _camH))
		{	
			//Position
			_camX -= _addW /2;
			_camY -= _addH /2;
			
			//Clamp the movement
			_camX = clamp(_camX, 0, room_width - _camW);
			_camY = clamp(_camY, 0, room_height - _camH);
			
		}
		else
		{
			_camW = _prevW - _addW;
			_camH = _prevH - _addH;
		}
		
		

	}

	// Set position
	camera_set_view_pos(camera, _camX, _camY);
	camera_set_view_size(camera,_camW, _camH);
}