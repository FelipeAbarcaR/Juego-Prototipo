/// @description configs
randomize();
StartEndState=false;
image_speed = 0;
global.enemy_hit = true; //true: enemy can be hit
global.enemy_atk = false; //true:enemy can do damage
global.enemy_hurt = false; //true: enemy got hurt

time_attack = round(random_range(3,4));
attack_delay=0.5; //seconds to wait to start counting to attack
hurt_delay=0.5;
collided=false;

stance = EnemyStance.wait;
state="idle"; //state para script fightrhythmanimate
bits=2;
bits2=2;
bitcount=0;
xi=x;
yi=y;

//Stats
maxhp=100;
hp=100;
DMG = 31;

// path sets
point_to_go=0;
on_point=false;
move_on_path = false;
attacking =false;
current_beat=0;
current_path = 0;
spd = 16;
endaction =	0;
absolute = 0;

//sprites
last_sprite=0;

spr_atk1=spr_CondaATK1;
spr_atk2=spr_CondaATK2;
spr_atk3=spr_CondaATK3;
spr_atk4=spr_CondaATK4;
spr_dead=spr_CondaDead;
spr_hurt=spr_CondaHurt;
spr_idle=spr_CondaIdle;

hola=48;