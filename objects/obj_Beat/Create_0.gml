/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Keep track of the current room and its associated data
current_music = global.room_data[global.currentroom][index.music];
current_bpm = global.room_data[global.currentroom][index.bpm];
// set bpm
bpm=current_bpm;

BeatTimeMS=((60)/bpm)*1000000
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
boxchancelenght=50;