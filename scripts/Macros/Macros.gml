#macro FRAME_RATE 60
#macro CARDINAL_DIR round(dir/90)
#macro CARDINAL_DIR_NPC round(direction/90)
#macro CARDINAL_DIR_PLAYER round(direction/45)
#macro ROOM_START roomMapaInicial
#macro RESOLUTION_W 480
#macro RESOLUTION_H 270
#macro TILE_SIZE 16
#macro TRANSITION_SPEED 0.02
#macro X_POS_TEXTBOX 36
#macro Y_POS_TEXTBOX 200 
#macro TEXTBOX_W 407
#macro TEXTBOX_H 80


//GEOMETRY DASH
enum obstacle{
	up,
	down,
	updown,
	updown2
}

#macro CAN_ATTACK		0
#macro hurrtt			1

//enums
enum states {
	IDLE,			//0
	MOVE,			//1
	ATTACK,			//2
	DEAD,			//3
	KNOCKBACK,		//4
	ROLL,			//5
	LOCK,			//6
	CROUCH,			//7
	JUMP,			//8
	AUTOMOVING		//9
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
	dead,
	locked,
	postattack
}

//general
enum Sala{
	TestMove,
	fight,
	Obstacles	
}

enum Index{
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

//Crypt traps
enum trap_type
{
	FLOOR,
	WALL,
	FLYING
}
