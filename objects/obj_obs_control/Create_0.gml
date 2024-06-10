/// @description Insert description here
// You can write your code in this editor

// Get the BPM of the music 
bpm = current(Index.bpm);

// Get the width of the room 
distance = obj_obs_player.x-x;

obs_speed=5;
delay=0; //how much of a beat it should wait to reach the player


time=0; 

//beat_map=[ [ 32.56,0 ],[ 36.61,1 ],[ 40.57,1 ],[ 44.50,0 ],[ 46.43,2 ],[ 48.43,1 ],[ 52.51,2 ],[ 56.40,1 ],[ 60.56,2 ],[ 62.56,1 ],[ 64.45,1 ],[ 68.49,1 ],[ 72.57,0 ],[ 76.54,1 ],[ 78.54,0 ],[ 80.47,1 ],[ 84.51,1 ],[ 88.44,1 ],[ 92.44,1 ],[ 96.56,0 ],[ 98.18,1 ],[ 99.54,0 ],[ 100.49,1 ],[ 104.46,1 ],[ 105.78,0 ],[ 108.39,1 ],[ 110.20,0 ],[ 112.50,1 ],[ 116.51,0 ] ];
beat_map=[ [ 16.44,0 ],[ 18.42,0 ],[ 20.36,2 ],[ 22.44,1 ],[ 24.45,2 ],[ 26.53,0 ],[ 28.61,1 ],[ 30.62,0 ],[ 32.42,2 ],[ 34.50,0 ],[ 36.55,2 ],[ 38.63,2 ],[ 40.64,1 ],[ 42.51,2 ],[ 44.56,0 ],[ 46.50,2 ],[ 48.51,1 ],[ 50.52,2 ],[ 52.57,0 ],[ 54.58,2 ],[ 56.52,2 ],[ 57.52,1 ],[ 58.63,2 ],[ 60.43,2 ],[ 62.58,2 ],[ 64.45,2 ],[ 66.46,2 ],[ 68.55,0 ],[ 70.52,2 ],[ 72.57,1 ],[ 74.51,2 ],[ 76.45,0 ],[ 78.42,2 ],[ 80.40,1 ],[ 82.48,2 ],[ 84.53,0 ],[ 86.47,2 ],[ 88.44,1 ],[ 90.45,2 ],[ 92.57,0 ],[ 94.51,2 ],[ 96.49,1 ],[ 102.17,2 ],[ 104.43,0 ],[ 106.61,2 ],[ 110.32,1 ],[ 112.50,2 ],[ 116.35,2 ],[ 120.41,0 ] ];
beat_play_array=[];

scr_ObstacleList();

hola=0;

////set the music
//with(obj_beat)
//{
//    audio_stop_all();
//	ResetBeatStats();
//	current_music=current(Index.music);
//	var _bgm = current_music;
//	audio_play_sound(_bgm,10,1,bgm_gain);
//	var _bpm=current(Index.bpm);
//	setBPM(_bpm);
//}

alarm[0]=room_speed*2;//*global.BeatTimeMS*1000000*2;
alarm[1]=room_speed*48;