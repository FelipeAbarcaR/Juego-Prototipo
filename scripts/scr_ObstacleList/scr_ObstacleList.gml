// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ObstacleList(){

for (var i = 0; i < array_length(beat_map); i++) {
    var beat_num = beat_map[i][0];
    var obstacle_type = beat_map[i][1];

    var creation_time = scr_calculate_creation_time(beat_num, bpm, obs_speed, distance);
    
    beat_play_array[i]=[creation_time,obstacle_type];

}
}