event_inherited();

//Intrinsic Variables
state = ENEMYSTATE.IDLE;
hSpeed = 0;
vSpeed = 0;
xTo = xstart;
yTo = ystart;
timepassed = 0;
waitduration = 60;
wait = 0;
dir = 0;
aggroCheck = 0;
aggroCheckDuration = 5;
statetarget = state;
stateprevious = state;
statewait = 0;
statewaitduration = 0;

//Enemy Sprites
sprMove = spr_slime;

//Enemy Scripts

enemyScript[ENEMYSTATE.IDLE] = -1;
enemyScript[ENEMYSTATE.WANDER] = -1;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.CHASE] = -1;
enemyScript[ENEMYSTATE.HURT] = -1;
enemyScript[ENEMYSTATE.WAIT] = EnemyWait; // nos ayudara para desde el wander al chase 
enemyScript[ENEMYSTATE.DIE] = -1;

