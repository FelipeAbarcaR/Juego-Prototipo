//Create camera

camera = camera_create_view(0,0,global.res.width,global.res.height);

//enable views and make view 0 visible

view_enabled = true;
view_visible[0] = true;

//Assign camera to view 0
view_set_camera( 0, camera);

cameraFollow = true;

//Zoom
global.zoom = 0;
global.zoom_height = 0;
global.zoom_width = 0;
global.percentage_zoom = 0;
