/// @description Insert description here
// You can write your code in this editor
time+=delta_time;
draw_text(100,100,"creation_time: "+string(creation_time));
draw_text(100,110,"seconds: "+string(time/1000000));
draw_text(100,120,"beat: "+string(global.BeatNumber));
