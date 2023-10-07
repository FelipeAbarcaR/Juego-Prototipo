/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
enum transition_step
{
    fading_out,
	set_parameters,
	fading_in
}

// Keep track of the current room and its associated data
current_music = current(Index.music);
current_bpm =current(Index.bpm);
last_music=-1;

new_music=-1;
snd=-1;
start_bgm_fade_in=-1;

//gains
bgm_gain=0.3;
sfx_gain=0.8;

// set bpm
global.bpm= current_bpm;
global.BeatTimeMS=((60)/global.bpm)*1000000 //time of a beat in microseconds
BeatTimeFrames=(60/global.bpm)*room_speed; //frames of a beat
global.beatchance=false;
global.beat=false;
global.beatprogress=0;
global.BeatNumber=0;

//parche para arreglar que el beat se vaya a los lados o al medio
beat_fix=false;
beats_per_input=2;

// range to beatchance
beat_hit_range=0.15;
beat_hit_range_slow=beat_hit_range/2;
beathitrange=beat_hit_range;

//BeatProgress
SumDelta=0; //para global beat
SumFullDelta=0; //para bar meter
BeatBarProgress=0;

// Barra HP
BeatBarLenght = 216;
BarHalf=BeatBarLenght/2;

//START BGM MUSIC
var _bgm = current(Index.music);
bgm_snd = audio_play_sound(_bgm,10,1,bgm_gain);

// gui_cosas
var _res=global.res;
guiwidth=display_get_gui_width();//camera_get_view_width(oCameraManager.camera);//display_get_gui_width();
guiheight=display_get_gui_height();//camera_get_view_height(oCameraManager.camera);//display_get_gui_height();
barscale=1.6;

//position of the beatbar. Set in Draw Event
barX=0;
barY=0;

depth=100;

//FADE OUT TRANSITION OPTIONS
bgm_transition_time=3;  //The length for the change in gain in seconds.
sound_fade_in=false;
start_BGM_transition= false;
change_step=transition_step.fading_out;
mid_fading=false;
starting_volume=0.1;
current_volume=starting_volume;
ready_to_transition_in=false;
transition_in_ready=false;
new_transition_time=-1;

wait_for_signal=false;


//perfect,good,bad
beat_hit_data = ds_list_create(); 


BGM_data=[
	[bgm_boss_01,127],
	[bgm_Feelings,115],
	[bgm_ForestTimeInterior,126],
	[bgm_ForestTime,126],
	[bgm_NightCall_118,118],
	[bgm_OneLove,107],
	[bgm_Kappn,130],
	[bgm_WillPower_89,89],
	[bgm_midnight_100,100]
];


//BEAT BAR 2.0

beat_bar_visible=1;

BeatTimeFrames=(60/global.bpm)*room_speed;

bar2_timer=0;

beat_meter_speed=3;

beat_frame_height=340;
beat_frame_width=80;

//beat_frame_height=sprite_get_height(spr_beat_frame_4);
//beat_frame_width=sprite_get_width(spr_beat_frame_4);

bar2_range=beat_frame_height*beathitrange;

bar2_x=global.res.guiwidth*(0.92);
bar2_y=global.res.guiheight*0.5;

beats_to_start=5;
time_to_beat=global.BeatTimeMS*beats_to_start;
time_to_reach_end=(beat_frame_height/beat_meter_speed)*(1/room_speed)*1000000;

heart_pulse=false;
beat_heart_shake_amplitude=5;
beat_heart_t=0;

//GROOVY STATE
groovy_count=0;
groovy_max=4;
global.groovy=false;

beat_meter_list=[]; 

sfx_groovy_error=error_style_05;

