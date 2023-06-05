/// @description Start Music& beats
// You can write your code in this editor

global.beatchance=false;
global.beat=false;
global.BeatNumber=0;
SumDelta=0;
SumFullDelta=0;
BeatBarProgress=0;
current_music = obj_game.room_data[global.currentroom][index.music];
current_bpm = obj_game.room_data[global.currentroom][index.bpm];
bpm=current_bpm;
BeatTimeMS=((60)/bpm)*1000000
audio_play_sound(current_music, 10, true,0.5);

