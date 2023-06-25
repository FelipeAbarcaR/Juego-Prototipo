/// @description Insert description here
// You can write your code in this editor

GridSpeed=1;
Rotation=0;
RotationSpeed=4;
RotationRange=90;
RotationRemaining=0;
GridDistance=16;
DistanceRemaining=0;
GridJumpHeight=0;
state="wait"

DMG=20;


switch Dir{
	case "Up":
	Direction=90;
	break;
	
	case "Down":
	Direction=270;
	break;
	
	case "Left":
	Direction=180;
	break;
	
	case "Right":
	Direction=0;
	break;
}

//LayerInfo
collisionmap = layer_tilemap_get_id(layer_get_id("CryptRange"));

sh_texture=shader_get_uniform(sha_white_outline,"texture_Pixel");