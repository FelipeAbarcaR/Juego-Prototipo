//DRAW SHADER =======================================================================
if global.isShaderEnabled == true
{    
    switch(shaderIndex)
    {
        case 0: //duotone map...
            var shader    = ds_list_find_value(shaderList,shaderIndex);
            var u_vRatio = shader_get_uniform(shader, "u_vRatio");
            var u_colorA = shader_get_uniform(shader, "u_colorA");
            var u_colorB = shader_get_uniform(shader, "u_colorB");
            
            var u_colorA_arr; //color A (RGB) - dark areas
            u_colorA_arr[0] = 0.1;
            u_colorA_arr[1] = 0.2;
            u_colorA_arr[2] = 0.35;
            
            var u_colorB_arr; //color B (RGB) - hi-lights
            u_colorB_arr[0] = 1.0;
            u_colorB_arr[1] = 0.9;
            u_colorB_arr[2] = 0.1;

            shader_set(shader);
                shader_set_uniform_f(u_vRatio, vRatio);
                shader_set_uniform_f(u_colorA, u_colorA_arr[0],u_colorA_arr[1],u_colorA_arr[2]);
                shader_set_uniform_f(u_colorB, u_colorB_arr[0],u_colorB_arr[1],u_colorB_arr[2]);
                draw_surface(application_surface,0,0);
            shader_reset();
            break;
        case 1: //thermal vision...
            var shader    = ds_list_find_value(shaderList,shaderIndex);
            var u_vRatio = shader_get_uniform(shader, "u_vRatio");
            var sampler0  = shader_get_sampler_index(shader, "sampler0")
            var texture0  = background_get_texture(thermalVision_map0);
            
            shader_set(shader);
                shader_set_uniform_f(u_vRatio, vRatio);
                texture_set_stage(sampler0,texture0);
                draw_surface(application_surface,0,0);
            shader_reset();
            break;
        case 2: //blur...
            var shader    = ds_list_find_value(shaderList,shaderIndex);
            var u_vRatio = shader_get_uniform(shader, "u_vRatio");
            var u_threshold = shader_get_uniform(shader, "u_threshold");
            
            var radius = 0.005;
            
            shader_set(shader);
                shader_set_uniform_f(u_vRatio, vRatio);
                shader_set_uniform_f(u_threshold, radius * oscillatorValue);
                draw_surface(application_surface,0,0);
            shader_reset();
            break;
        case 3: //outliner...
            var shader    = ds_list_find_value(shaderList,shaderIndex);
            var u_vRatio = shader_get_uniform(shader, "u_vRatio");
            var u_threshold = shader_get_uniform(shader, "u_threshold");
            
            var radius = 0.005;
            
            shader_set(shader);
                shader_set_uniform_f(u_vRatio, vRatio);
                shader_set_uniform_f(u_threshold, radius);
                draw_surface(application_surface,0,0);
            shader_reset();
            break;
        case 4: //bloom...
            var shader    = ds_list_find_value(shaderList,shaderIndex);
            var u_vRatio = shader_get_uniform(shader, "u_vRatio");
            var u_threshold = shader_get_uniform(shader, "u_threshold");
            var u_radius    = shader_get_uniform(shader, "u_radius");
            var u_amount    = shader_get_uniform(shader, "u_amount");
            
            var threshold = 0.75;
            var radius = 0.02;
            var amount = 5.0;
            
            shader_set(shader);
                shader_set_uniform_f(u_vRatio, vRatio);
                shader_set_uniform_f(u_radius, radius);
                shader_set_uniform_f(u_threshold, threshold);
                shader_set_uniform_f(u_amount, amount * oscillatorValueAbs);
                draw_surface(application_surface,0,0);
            shader_reset();
            break;
    }
}




//DRAW TEXT HINTS =======================================================================
var text_text = "Press [SPACEBAR] to change the postFX shader.#Hold [CONTROL] to disable the shader.#Press [ESC] to exit.";
var text_credits = "Background Art by: Paco M. & Dodozen."
var text_posx = 10;
var text_posy = 10;

var text_creditsx = 10;
var text_creditsy = room_height - 30;

draw_set_halign(fa_left);
draw_set_valign(fa_top);

//text-hint shadow
draw_set_color(c_black); 
draw_text(text_posx+1,text_posy+1,string_hash_to_newline(text_text));

//text-hint
draw_set_color(c_white);
draw_text(text_posx,text_posy,string_hash_to_newline(text_text));

//text-credits shadow
draw_set_color(c_black); 
draw_text(text_creditsx+1,text_creditsy+1,string_hash_to_newline(text_credits));

//text-credits
draw_set_color(c_orange);
draw_text(text_creditsx,text_creditsy,string_hash_to_newline(text_credits));


