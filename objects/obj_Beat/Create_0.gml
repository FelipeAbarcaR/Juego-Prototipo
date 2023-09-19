/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
enum transition_step
{
    fading_out,
	set_parameters,
	fading_in
}
// Keep track of the current room and its associated data
current_music = global.room_data[global.currentroom][Index.music];
current_bpm = global.room_data[global.currentroom][Index.bpm];
last_music=-1;

new_music=-1;
snd=-1;
start_bgm_fade_in=-1;

//gains
bgm_gain=0.3;
sfx_gain=0.9;

// set bpm
global.bpm= current_bpm;

global.BeatTimeMS=((60)/global.bpm)*1000000 //time of a beat in microseconds
BeatTimeFrames=(60/global.bpm)*room_speed; //frames of a beat
global.beatchance=false;
global.beat=false;
global.Move=false;	
global.beatprogress=0;
global.BeatNumber=0;

// range to beatchance
beathitrange=0.60;

//BeatProgress
SumDelta=0; //para global beat
SumFullDelta=0; //para bar meter
BeatBarProgress=0;


// Barra HP
BeatBarLenght = 216;
BarHalf=BeatBarLenght/2;

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
bgm_snd=-1;
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
	[bgm_NightCall_118,115],
	[bgm_OneLove,107],
	[bgm_Kappn,130],
	[bgm_WillPower_89,(89/2)/2]
];