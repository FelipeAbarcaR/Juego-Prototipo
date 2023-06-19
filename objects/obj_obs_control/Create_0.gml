/// @description Insert description here
// You can write your code in this editor
// Get the BPM of the music (replace with your actual BPM)
bpm = global.room_data[global.currentroom][index.bpm];

// Get the width of the room (replace with your actual room width)
distance = obj_obs_player.x-x;

obs_speed=4;
// Calculate the creation time for the obstacle
creation_time = scr_calculate_creation_time(13,bpm,obs_speed,distance);

time=0; 