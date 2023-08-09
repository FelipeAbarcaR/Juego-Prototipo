/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Keep track of the current room and its associated data
current_music = global.room_data[global.currentroom][index.music];
current_bpm = global.room_data[global.currentroom][index.bpm];
last_music=-1;
sound_fade_in=false;
start_BGM_transition= false;
new_music=-1;
snd=-1;
start_bgm_fade_in=-1;

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


//perfect,good,bad
beat_hit_data = ds_list_create(); 


BGM_data=[
	[bgm_boss_01,127],
	[bgm_Feelings,115],
	[bgm_ForestTimeInterior,126],
	[bgm_ForestTime,126],
	[bgm_NightCall,115],
	[bgm_OneLove,107]
];