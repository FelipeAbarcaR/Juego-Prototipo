	/// @description

if (stance!=EnemyStance.dead) FightRhythmAnimate();


if ( stance ==  EnemyStance.prepare)
{
	rumheight=room_height;
	rumwidth=room_width;
	guiheight=display_get_gui_height();
	guiwidth=display_get_gui_width();
	camheight=camera_get_view_height(obj_camera.cam);
	camwidth=camera_get_view_width(obj_camera.cam);	
	breaktopointo=10;
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
		on_point = scr_FightEnemyMove();
		if (on_point /*and _ishalfbeat*/) move_on_path=false;
	}
	}
}
//idle state, wait for for certain beats to start attack
if (stance ==  EnemyStance.wait)
{
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
if (global.enemy_hurt)
{
	global.enemy_hurt=false;
	global.enemy_hit=false;
	if (bitcount>0) bitcount--;
	last_sprite=sprite_index;
	sprite_index=spr_hurt;
	alarm[1]=room_speed*hurt_delay;
}