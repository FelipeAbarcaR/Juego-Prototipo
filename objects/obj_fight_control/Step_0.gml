/// @description end fight

//end fight
if(obj_Conde.hp<=0)	obj_Conda.stance=EnemyStance.idle;
if(obj_Conda.hp<=0)
{
	obj_Conda.stance=EnemyStance.dead;
	with(obj_Conde)
	state="stop";
}

if (fighter1.draw_hp2==true)
{
    alarm[0]=room_speed;
	fighter1.draw_hp2=false;
}

if (fighter2.draw_hp2==true)
{
    alarm[1]=room_speed;
	fighter2.draw_hp2=false;
}