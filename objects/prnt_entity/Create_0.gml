flash = 0;
flashShader = sha_white_flash;
uFlash = shader_get_uniform(flashShader,"flash");
entityDroplist = -1;
collisionmap = layer_tilemap_get_id(layer_get_id("Col"));
spd = 0;
z= 0;