bounce =0;
deteriorate =0;
z=0;
spd =0;
Friction = 0;
image_speed =0;
image_index = irandom(image_number -1);
var _lay_id=layer_get_id("Col")
if(_lay_id!=-1) collisionmap = layer_tilemap_get_id(_lay_id) else collisionmap=-1
image_xscale = choose(-1,1);