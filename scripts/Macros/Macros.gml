	#macro FRAME_RATE 60
#macro CARDINAL_DIR round(dir/90)
#macro CARDINAL_DIR_NPC round(direction/90)
#macro ROOM_START roomMapaInicial
#macro RESOLUTION_W 480
#macro RESOLUTION_H 270
#macro TILE_SIZE 16
#macro OUT 0
#macro IN 1
#macro TRANSITION_SPEED 0.02
#macro X_POS_TEXTBOX 36
#macro Y_POS_TEXTBOX 200 
#macro TEXTBOX_W 407
#macro TEXTBOX_H 80


//GEOMETRY DASH
enum obstacle{
	up,
	down,
	updown
}

#macro CAN_ATTACK		0
#macro hurrtt			1

//enums
enum states {
	IDLE,
	MOVE,
	ATTACK,
	DEAD,
	KNOCKBACK,
	ROLL,
	LOCK,
	CROUCH,
	JUMP
}

enum ENEMYSTATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT
}

//battle
enum EnemyStance{
	prepare,
	attack,
	wait,
	hit,
	endstance,
	idle,
	dead
}

//general
enum Sala{
	TestMove,
	fight,
	Obstacles	
}
enum index{
	name,
	music,
	bpm,
	follow,
	mode,
	mainchar
}
enum mode{
	move,
	grid,
	fight,
	obstacle	
}

enum signindex{
	house,
	danger,
	monster
}

