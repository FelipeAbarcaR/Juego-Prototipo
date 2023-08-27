/// @description Insert description here
// You can write your code in this editor

y_pos-=move_speed;
image_alpha-=alpha_speed;

if(image_alpha<=0)
{
    instance_destroy();
}
