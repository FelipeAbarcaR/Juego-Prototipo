/// @description Insert description here
// You can write your code in this editor

instance_destroy(camera_recorder);

var _len=array_length(deactivated_list)
if(_len>0)
{
    for(var i=0;i<_len;i++)
	{
	    instance_activate_object(deactivated_list[i]);
	}
}


