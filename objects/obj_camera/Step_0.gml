if(instance_exists(follow))
	{
	xTo = follow.x;
	yTo = follow.y;
	}
x += (xTo - x) / 15;
y += (yTo - y) / 15;
x = clamp(x, viewwitdhhalf, room_width - viewwitdhhalf);
y = clamp(y, viewheighthalf, room_height - viewheighthalf);

camera_set_view_pos(cam, x - viewwitdhhalf, y - viewheighthalf);