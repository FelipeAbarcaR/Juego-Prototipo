var _lay_id = layer_get_id("Col");
if(_lay_id!=-1) collisionmap = layer_tilemap_get_id(layer_get_id("Col")) else collisionmap=-1;

if(id.EntityActivateScript == startDialogue and id.EntityActivateArgs == [-1])
{
	id.EntityActivateScript = -1;
}