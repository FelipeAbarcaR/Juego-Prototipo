/// @description Insert description here
// You can write your code in this editor

// Get the BPM of the music 
bpm = global.room_data[global.currentroom][index.bpm];

// Get the width of the room 
distance = obj_obs_player.x-x;

obs_speed=3;
delay=0.5; //how much of a beat it should wait to reach the player

time=0; 

beat_map=[ [ 32.56,0 ],[ 36.61,1 ],[ 40.57,1 ],[ 44.50,0 ],[ 46.43,2 ],[ 48.43,1 ],[ 52.51,0 ],[ 56.40,1 ],[ 60.56,2 ],[ 62.56,1 ],[ 63.51,0 ],[ 64.45,1 ],[ 68.49,1 ],[ 72.57,0 ],[ 76.54,1 ],[ 78.54,0 ],[ 80.47,1 ],[ 84.51,1 ],[ 88.44,1 ],[ 92.44,1 ],[ 96.56,0 ],[ 98.18,1 ],[ 99.54,0 ],[ 100.49,1 ],[ 104.46,1 ],[ 105.78,0 ],[ 108.39,1 ],[ 110.20,0 ],[ 112.50,1 ],[ 116.51,0 ] ];

beat_play_array=[];

scr_ObstacleList()