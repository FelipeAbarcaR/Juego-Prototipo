/// @description recover from getting hurt
// You can write your code in this editor
if(state!=fight_state.dead)
{
	sprite_index=last_sprite;
	global.enemy_hit=true;
	status_hurt=false;
}

