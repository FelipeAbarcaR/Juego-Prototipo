event_inherited();

global.npc_follow = {};
flash = 0;
flashShader = sha_white_flash;
uFlash = shader_get_uniform(flashShader,"flash");
//entityDroplist = -1;
//collisionmap = layer_tilemap_get_id(layer_get_id("Col"));
spd = 0;
z= 0;
dialogue_sounds=[];
text_id = ""; 
conversation_number = 0;

player_active_range=false;

if(EntitySpaceBarActive)
{
    space_bar = instance_create_depth(x,bbox_top - 3,depth-1,obj_space_NPC);
	instance_deactivate_object(space_bar);
}

automoving=false;
x_dest=-1;
y_dest=-1;
automove_relative=false;
automove_spd=spd