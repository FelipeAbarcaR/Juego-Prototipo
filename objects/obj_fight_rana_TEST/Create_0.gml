/// @description Insert description here
// You can write your code in this editor
randomize();

fight_state=
{
    wait		: 0,
	prepare		: 1,
	attacking	: 2,
	stun		: 3,
	locked		: 4,
	dead		: 5,
}

state=fight_state.locked;

fight_sprite_wait=spr_frog_idle_TEST;
fight_sprite_prepare=spr_frog_prepare_1_TEST;
fight_sprite_prepare_mid =spr_frog_prepare_3_TEST;
fight_sprite_prepare_updown=spr_frog_prepare_2_TEST;
fight_sprite_attacking=spr_frog_attack_2_TEST;
fight_sprite_attacking_mid=spr_frog_attack_1_TEST;
fight_sprite_hurt=spr_frog_hurt_1_TEST;

wait_count=0;
wait_max=4;

beat_start_prepare=-1;
prepare_points=-1;

//points to move
x_start=xstart;
y_start=ystart;
x_to=-1;
y_to=-1;
x_from=0;
y_from=0;
x_atk_offset=100;

//cam corners
corner_x=uc_get_view_x();
corner_y=uc_get_view_y();

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
status_hurt=false;

draw_hp2=false;

attack_collision=false; //si es que hubo colisiónentre el ataque enemigo y el jugador

//delays
delay_post_attack=1;
hurt_delay=0.3;

//MOVES
current_move=-1;
current_point=0;

var _move_1=
[
	//attack up
	[ 52.29,1,402.00,131.00 ],
	[ 53.25,1,430.00,183.00 ],
	[ 54.08,1,396.00,242.00 ],
	[ 55.40,2,58.00,124.00 ],
	[ 56.26,0,0,0 ]
];
var _move_2=
[
	//attack down
	[ 60.08,1,398.00,245.00 ],
	[ 61.00,1,433.00,183.00 ],
	[ 62.06,1,402.00,134.00 ],
	[ 63.44,2,67.00,244.00 ],
	[ 64.18,0,0,0 ]
];

var _xs=xstart-corner_x;
var _ys=ystart-corner_y;
var _move_3=
[
	//attack middle
	[ 68.19,1,_xs,_ys ],
	[ 69.15,1,_xs,_ys ],
	[ 69.95,1,415.00,_ys ],
	[ 71.17,2,34.00,190.00 ],
	[ 72.06,0,0,0 ]
];

var _move_4=
[
	//attack middle-up-down
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

moves = scale_moves(moves,1/1.2)

//SPRITES
last_sprite=-1

fight_prepare_sprites=
[
	fight_sprite_prepare,
	fight_sprite_prepare,
	fight_sprite_prepare_mid,
	fight_sprite_prepare_updown
]


fight_attack_sprites=
[
	fight_sprite_attacking,
	fight_sprite_attacking,
	fight_sprite_attacking_mid,
	fight_sprite_attacking

]

stance=0
bitcount=0
fight_attack_path=-1;

//wait until start attacking ARREGLAR
alarm[0]=4*room_speed;

//SFX 
	//PREPARE
	sfx_prepare[0]=sfx_prepare1;
	sfx_prepare[1]=sfx_prepare2;
	sfx_prepare[2]=sfx_prepare3;
	//ATK
	sfx_sword=sfx_sword_slash
//SHADERS
//red flash hit

start_flash1=false;
current_flash=0.0;
flash=0.5;
sh_fhlash=shader_get_uniform(sha_red_flash,"flash");
x1=0; //to use in draw
	
//white outline
sh_texture=shader_get_uniform(sha_white_outline,"texture_Pixel");

sh_texture2=shader_get_uniform(sha_gray,"texture_Pixel");

//variable para ver si se tiro el skill cerca de esa posicion (TEST)
attack_effect_launched=false;

//EFFECTS SPRITES
spr_fx_atk=spr_fx_fight_atk1;

initial_x_scale=image_xscale;
initial_y_scale=image_yscale;