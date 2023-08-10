//PREPARE THE DISPLAY
display_set_gui_size(room_width, room_height);

if os_type == os_android
{
    //distort the sampler uvs according to the screen ratio in the mobile devices...
    vRatio = display_get_gui_width() / display_get_gui_height();
}else{
    vRatio = 1.0;
}

//SHADER LIST:
shaderIndex = 0;
shaderList = ds_list_create();
ds_list_add(shaderList, shader_duoTone);
ds_list_add(shaderList, shader_thermalVision);
ds_list_add(shaderList, shader_blur);
ds_list_add(shaderList, shader_outliner);
ds_list_add(shaderList, shader_bloom);

//SHADER ASSETS:
thermalVision_map0 = smp_thermalRamp;

global.isShaderEnabled = true;

//EXTRAS:
timeCounter = 0;
timeStep = 0.05;
oscillatorValue = 0;
oscillatorValueAbs = 0;

