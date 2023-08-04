/// @description Insert description here
// You can write your code in this editor

if (!keyboard_check(vk_lcontrol) && keyboard_check_pressed(vk_add)) {
    blur_steps++;
}
if (!keyboard_check(vk_lcontrol) && keyboard_check_pressed(vk_subtract)) {
    blur_steps--;
}
if (keyboard_check(vk_lcontrol) && keyboard_check_pressed(vk_add)) {
    sigma+=0.1;
}
if (keyboard_check(vk_lcontrol) && keyboard_check_pressed(vk_subtract)) {
    sigma-=0.1;
}

