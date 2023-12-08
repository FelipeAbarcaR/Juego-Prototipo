event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites 

sprMove = spr_slime;
sprAttack = spr_slime_attack;
sprHurt = spr_slime_hurt;
sprDie = spr_slime_die;

//Enemy Scripts

enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack;
enemyScript[ENEMYSTATE.HURT] = Slimehurt;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;

//entityDroplist = choose
//(
//	[obj_coin],
//	[obj_coin,obj_coin],
//	[obj_bomb_drop],
//	[obj_arrow_drop]
//)

