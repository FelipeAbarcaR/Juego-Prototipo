/// @description Insert description here
// You can write your code in this editor
global.runny_activate_frenzy=false;
view_height=270;

left_side=115;
right_side=360;

n_chance=70;
chance=1;
var _bgm =room_get_bgm(room);
bpm=get_bpm(_bgm)



//runny_map=[ [ 16.50,0 ],[ 17.98,0 ],[ 19.12,0 ],[ 20.05,0 ],[ 22.93,0 ],[ 24.02,0 ],[ 25.98,0 ],[ 27.06,0 ],[ 28.05,0 ],[ 30.14,0 ],[ 31.09,0 ],[ 32.10,4 ],[ 35.01,0 ],[ 39.01,0 ],[ 40.17,0 ],[ 41.92,0 ],[ 43.09,0 ],[ 44.01,0 ],[ 46.29,0 ],[ 47.11,0 ],[ 48.12,0 ],[ 51.11,0 ],[ 51.98,0 ],[ 54.05,0 ],[ 55.29,0 ],[ 56.12,0 ],[ 59.08,0 ],[ 60.04,0 ],[ 62.15,0 ],[ 63.13,0 ],[ 64.03,0 ],[ 66.18,0 ],[ 67.11,0 ],[ 67.95,0 ],[ 70.05,0 ],[ 71.11,0 ],[ 72.24,0 ],[ 74.94,0 ],[ 76.16,0 ],[ 78.97,0 ],[ 80.16,0 ],[ 82.92,0 ],[ 83.92,0 ],[ 86.94,0 ],[ 88.00,0 ],[ 90.06,0 ],[ 91.07,0 ],[ 92.02,0 ],[ 94.86,0 ],[ 96.10,0 ],[ 96.82,4 ] ]
runny_map=[ [ 16.02,0 ],[ 18.00,0 ],[ 19.05,0 ],[ 20.00,0 ],[ 22.06,0 ],[ 23.09,0 ],[ 23.99,0 ],[ 26.12,0 ],[ 27.07,0 ],[ 27.97,0 ],[ 30.03,0 ],[ 31.03,0 ],[ 32.09,4 ],[ 35.12,0 ],[ 36.05,0 ],[ 39.06,0 ],[ 40.06,0 ],[ 43.07,0 ],[ 44.07,0 ],[ 47.05,0 ],[ 47.97,0 ],[ 48.05,2 ],[ 51.11,0 ],[ 52.04,0 ],[ 55.05,0 ],[ 56.00,0 ],[ 59.08,0 ],[ 60.03,0 ],[ 63.07,0 ],[ 63.99,0 ],[ 64.10,2 ],[ 67.16,0 ],[ 68.06,0 ],[ 68.72,1 ],[ 71.14,0 ],[ 71.99,0 ],[ 72.65,1 ],[ 75.02,0 ],[ 76.03,0 ],[ 79.06,0 ],[ 80.04,0 ],[ 80.62,1 ],[ 83.05,0 ],[ 84.10,0 ],[ 84.92,1 ],[ 87.03,0 ],[ 88.09,0 ],[ 88.82,1 ],[ 91.01,0 ],[ 92.02,0 ],[ 92.60,1 ],[ 94.97,0 ],[ 96.08,0 ] ]

runny_play_array=[];

for (var i = 0; i < array_length(runny_map); i++) {
    var beat_num = runny_map[i][0];
    var obstacle_type = runny_map[i][1];
    var creation_time= scr_calculate_creation_time(beat_num, bpm,1, 0);
    runny_play_array[i]=[creation_time,obstacle_type];
}

time=0;

frenzy_time=15 //seconds