	/// @description Insert description here
// You can write your code in this editor



image_alpha-=vanish;
if image_alpha<=0 instance_destroy();
if(delta_scaling!=0)
{
    image_xscale=image_xscale+delta_scaling;
	image_yscale=image_yscale+delta_scaling;
}