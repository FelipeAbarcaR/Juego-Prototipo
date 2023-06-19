/// @function                scr_calculate_creation_time(beatnum,bpm,distance)
/// @description             Calculate the time it takes for an obstacle to reach the player
/// @arg beatnum
/// @arg bpm
/// @arg speed
/// @arg distance


//function scr_calculate_creation_time(_beatnum,_bpm,_speed,_distance){
///// scr_calculate_creation_time(bpm, room_width)

//var beats_per_second = _bpm / 60; // Calculate beats per second
//var beat_duration = 1 / beats_per_second; // Calculate duration of one beat

//// Calculate the time (in seconds) it takes for an obstacle to reach the right border
//var obstacle_time = _distance / _speed;

//// Calculate the time (in seconds) it takes for the obstacle to reach the top right corner
//var target_time = obstacle_time + _beatnum * beat_duration;

//return target_time;
//}
function scr_calculate_creation_time(_beatnum, _bpm, _speed, _distance) {
    var beats_per_second = _bpm / 60; // Calculate beats per second
    var beat_duration = 1 / beats_per_second; // Calculate duration of one beat

    // Calculate the time (in seconds) it takes for an obstacle to reach the target distance
    var obstacle_time = (_distance / _speed)/room_speed;

    // Calculate the time (in seconds) it takes for the obstacle to reach the target beat
    var target_time = (_beatnum * beat_duration);

    // Calculate the final creation time by adjusting for the speed and desired beat
    var creation_time = target_time -obstacle_time;

    return creation_time;
}