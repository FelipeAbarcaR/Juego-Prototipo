/// @description hola

//the fight started signal, for obj_beat (for now)
global.fight_music_start=true;
global.start_fight=false;
fighter1=obj_fight_gato;
fighter2=global.fightEnemy;

marginw=140;
marginh=50;

//HP decreasing animation
decreasing=false;
decreasing2=false;
decrease_value=0.01;
width_value=1;
width_value2=1;

background=global.fightBackground;
draw_background=false;

bg_width=global.res.width;
bg_height=global.res.height;

//Part 1 of fight, deactivate all and start fight transition

oCameraManager.cameraFollow=false;
FightTransitionStart(background,sqFightFadeOut,sqFightFadeIn);

//beat count to start fight (or create hand)
beat_count=0;
beats_to_start=3;
beat_counting=false;

//mid transition parameters
time_transition_in=0.3;
create_fighters=false;
fighters_created=false;

