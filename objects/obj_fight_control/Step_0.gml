/// @description end fight

//end fight
if(obj_Conde.hp<=0)	obj_Conda.stance=EnemyStance.idle;
if(obj_Conda.hp<=0)
{
	obj_Conda.stance=EnemyStance.dead;
	with(obj_Conde)
	state="stop";
}