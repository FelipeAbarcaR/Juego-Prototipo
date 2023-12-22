/// @description Insert description here
// You can write your code in this editor

fight_state=
{
    wait		: 0,
	prepare		: 1,
	attacking	: 2,
	stun		: 3,
	locked		: 4,
}

state=fight_state.wait;

//MOVES
current_move=-1;

var _move_1=
[
	[ 52.29,1,402.00,131.00 ],
	[ 53.25,1,430.00,183.00 ],
	[ 54.08,1,396.00,242.00 ],
	[ 55.40,2,58.00,124.00 ],
	[ 56.26,0,0,0 ]
];
var _move_2=
[
	[ 60.08,1,398.00,245.00 ],
	[ 61.00,1,433.00,183.00 ],
	[ 62.06,1,402.00,134.00 ],
	[ 63.44,2,67.00,244.00 ],
	[ 64.18,0,0,0 ]
];

var _move_3=
[
	[ 68.19,1,328.00,187.00 ],
	[ 69.15,1,329.00,190.00 ],
	[ 69.95,1,415.00,189.00 ],
	[ 71.17,2,34.00,190.00 ],
	[ 72.06,0,0,0 ]
];

var _move_4=
[
	[ 76.17,1,329.00,192.00 ],
	[ 77.13,1,430.00,185.00 ],
	[ 77.99,1,421.00,190.00 ],
	[ 79.34,2,52.00,190.00 ],
	[ 79.79,2,61.00,146.00 ],
	[ 80.33,2,59.00,235.00 ],
	[ 81.27,0,0,0 ]
];

moves=[];
array_push(moves,_move_1,);
array_push(moves,_move_2);
array_push(moves,_move_3);
array_push(moves,_move_4);


//fight_move_names=
//{
//    "up",
//	"down",
//	"middle"
	
//}
fight_sprite_wait=spr_frog_idle_TEST;
wait_count=0;
wait_max=3;


beat_start_prepare=-1;

//points to move
x_start=xstart;
y_start=ystart;
x_to=-1;
y_to=-1;
x_from=0;
y_from=0;

//cam corners
corner_x=uc_get_view_x();
corner_y=uc_get_view_y();

//player move


//Stats
hp=100;
hpmax=hp;
DMG = 20;

//play options
bgm=bgm_Feelings;
bpm=115;

//status
status_immunity=false;
status_attacking=false;

draw_hp2=false;