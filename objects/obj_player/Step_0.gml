keyleft = keyboard_check(vk_left) or keyboard_check(ord("A"));
keyright = keyboard_check(vk_right)or keyboard_check(ord("D"));
keyup = keyboard_check(vk_up)or keyboard_check(ord("W"));
keydown = keyboard_check(vk_down) or keyboard_check(ord("S"));
keyactivate = keyboard_check_pressed(vk_space);
keyattack = keyboard_check_pressed(ord("M"));
inputdirection = point_direction(0,0,keyright-keyleft,keydown-keyup);
inputmagnitude = (keyright - keyleft != 0) or (keydown - keyup !=0 );

if (!global.gamepaused) 
{
	script_execute(state);
	invulnerable = max(invulnerable - 1, 0);
	flash = max(flash - 0.05, 0);
}
