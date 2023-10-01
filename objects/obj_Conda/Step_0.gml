	/// @description

//enemies loop on frames on rhythm
if (stance!=EnemyStance.dead) FightRhythmAnimate();

if ( stance ==  EnemyStance.prepare)
{
	var _waiting=false;
	if(prepare_wait_beats>0)
	{
	    _waiting=true;
		if(global.beat)
		{
		    prepare_wait_beats--;
			hola=10;
		}
	}
	if(!_waiting)
	{
		if (current_beat != global.BeatNumber)
		{
			current_beat=global.BeatNumber;
			move_on_path=true;
		}
	
		if (move_on_path==true)
		{
			//var _ishalfbeat=(global.beatprogress>=0.45)
			if (/*_ishalfbeat &&*/ move_on_path)
			{
				var _on_point = scr_FightEnemyMove();
				if (_on_point /*and _ishalfbeat*/)
				{
					move_on_path=false;
				}
		
			}
		}
	}
}

if (stance ==  EnemyStance.wait)
{
	//idle state, wait for for certain beats to start attack
	
	if (global.beat=true) bitcount++;
	if (bitcount==bits)
	{
		 bitcount=0;
		 stance=  EnemyStance.prepare;
		 scr_ataque1();
	}
}
if (stance ==  EnemyStance.attack)
{
	if (!collided)
	{
		global.enemy_atk = true;
		global.enemy_hit = false;
	}
	
	if (!attacking)
	{
		if (global.beat=true) bitcount++;
		if (bitcount=bits2)
		{
			bitcount=0;
			scr_ataque1p2();
			attacking= true;
		}
	}
	if (attacking) scr_FightEnemyMove();
}
if (stance== EnemyStance.endstance && StartEndState=true)
{
	alarm[0]=room_speed*attack_delay;
	StartEndState=false;
}
if (stance==EnemyStance.idle) //does nothing
{
	x=xstart;
	y=ystart;
	global.enemy_hit=0;
}
if (stance==EnemyStance.dead)
{
	sprite_index=spr_dead;
	image_speed=1;
	if(image_index>=image_number-1)
	{
		image_speed=0;
	}
}
if(stance==EnemyStance.locked)
{
    // code here
}
if(stance== EnemyStance.postattack)
{
    var _on_point = scr_FightEnemyMove();
	hola=10;
}
if (global.enemy_hurt)
{
	global.enemy_hurt=false;
	global.enemy_hit=false;
	if (bitcount>0) bitcount--;
	last_sprite=sprite_index;
	sprite_index=spr_hurt;
	alarm[1]=room_speed*hurt_delay;
	start_flash1=true;
}