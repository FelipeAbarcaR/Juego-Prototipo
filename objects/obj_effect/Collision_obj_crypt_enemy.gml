/// @description Insert description here
// You can write your code in this editor
if(variable_instance_exists(id,"creator"))
{
	if(other.object_index!=creator.object_index)
	{
		with(other)
		{
			instance_destroy();
		};
	};
};




