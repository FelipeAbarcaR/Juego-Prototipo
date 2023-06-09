//Create camera

camera = camera_create_view(0,0,global.res.width,global.res.height);

//enable views and make view 0 visible

view_enabled = true;
view_visible[0] = true;

//Assign camera to view 0
view_set_camera( 0, camera);

cameraFollow = true;