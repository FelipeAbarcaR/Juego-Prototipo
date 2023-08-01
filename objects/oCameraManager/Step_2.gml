// Follow player
if (cameraFollow) {
	// Player to follow
	var _plr = global.room_data[global.currentroom][index.follow];

	// Get camera properties
	var _camW = global.res.width;
	var _camH = global.res.height;
	
	// Get new position for camera
	var _camX = _plr.x - _camW / 2;
	var _camY = _plr.y - _camH / 2;
	
	// Clamp position to room
	_camX = clamp(_camX, 0, room_width - _camW);
	_camY = clamp(_camY, 0, room_height - _camH);
	
	// Set position
	camera_set_view_pos(camera, _camX, _camY);
}