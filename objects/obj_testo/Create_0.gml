/// @description Insert description here
// You can write your code in this editor

/// Create Event


blurry_shader = shader_blur;
u_blur_steps = shader_get_uniform(blurry_shader,"blur_steps");
u_sigma = shader_get_uniform(blurry_shader, "sigma");
u_texel_size = shader_get_uniform(blurry_shader, "texel_size");

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

texel_w = 1/global.res.width;
texel_h = 1/global.res.height;

surface_textbox = -1; // Initialize the surface variable



blur_steps=15;
sigma=0.5;

//blur effect marketplace
vRatio = 1.0;
timeCounter = 0;
timeStep = 0.05;
oscillatorValue = 0;
oscillatorValueAbs = 0;
holavalue=1;


