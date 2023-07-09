/// @description Insert description here
// You can write your code in this editor


if (creation_time <= 0 && !instance_exists(obj_prnt_obstacle)) {
    // Create the obstacle
    instance_create_depth(x, y,depth, obj_prnt_obstacle);
} else {
    // Decrease the creation time by the time passed
    creation_time -= delta_time / 1000000; // Convert delta_time to seconds
}