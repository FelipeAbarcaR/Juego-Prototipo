/// @description reset and wait
// You can write your code in this editor
if (stance!=EnemyStance.dead)
{
	played_sfx=false;
	x = xstart;
	y = ystart;
	global.enemy_atk = false;
	global.enemy_hit = true;
	stance = EnemyStance.wait;
	bitcount=0;
	collided=false;
}
